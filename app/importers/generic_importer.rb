class GenericImporter

  def initialize(feed)
    @feed = feed
    @import = Import.create(feed: feed)
    @error = 0
    @success = 0
    @updated = 0
    @rejected = 0
  end

  def import
    adapter = load_adapter(@feed)
    importation do
      docs = adapter.open_feed(@feed.url)
      # limit import in production to stay in free plans
      import_size = ENV["import_limit"].to_i || 10
      #binding.pry
      docs.take(import_size).each do |product|
        attributes = adapter.parse(product)
        if adapter.valid?(product)
          addProduct(attributes)
        else
          puts "Product: #{attributes[:ean]} is invalid"
          @rejected += 1
        end
      end
    end
  end

  private

  def importation
    @import.started_at = Time.now
    @import.update(status: :pending)
    begin
      yield
      @import.update(status: :success)
    rescue => e
      @import.message = e
      @import.update(status: :error)
    end
    puts "Feed #{@feed.supplier} : success => #{@success}, errors => #{@error},  rejected => #{@rejected}, updated => #{@updated} "
    total = @success+@error+@rejected
    success_rate = total==0 ? 0 : @success.fdiv(total)
    @import.update(finished_at: Time.now, total: total, success_rate: success_rate, rejected: @rejected )
  end

  def load_adapter(feed)
    adapter_prefix = feed.adapter.capitalize
    adapter = Object.const_get("#{adapter_prefix}Adapter")
    adapter.new
  end

  def addProduct(attributes={})
    # on vérifie si le produit existe déjà
    p = Product.find_by_ean(attributes[:ean])
    if p.nil?
      createProduct(attributes)
    else
      updateProduct(p, attributes)
    end
  end

  def updateProduct(p, attributes)
    p.offers.where(supplier: @feed.supplier, size:attributes[:size] ).each do |o|
      o.destroy!
   end
    p.offers.build(supplier: @feed.supplier, price: attributes[:price], link: attributes[:link], size: attributes[:size])
    @updated += 1
    saveProduct(p)
  end

  def createProduct(attributes)
    p = Product.new
    p.ean = attributes[:ean]
    p.description = attributes[:description]
    p.image = attributes[:image]
    p.color = attributes[:color]
    p.title = attributes[:title]
    p.category = attributes[:category]
    p.brand = Brand.where(name: attributes[:brand]).first_or_create(name: attributes[:brand])
    p.offers.build(price: attributes[:price], supplier: @feed.supplier, link: attributes[:link], size: attributes[:size] )
    saveProduct(p)
  end

  def saveProduct(product)
    if product.save
      @success += 1
    else
      @error += 1
      p product.errors.messages
    end
  end

end
