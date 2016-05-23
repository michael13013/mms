class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def index
    # params[:looks] = {'20' => '1'} if params[:looks].blank? or \
    # (params[:looks].include? '20' and params[:looks]['20'] == '1')
    session['search_params'] = params

    query = params[:query]
    category = params[:category]
    size = params[:size]
    color = params[:color]

    @looks = params[:looks] || []

    if @looks.length == 0
      products_from_brand = Product.includes(:brand).all
      @looks_name = ["-"]
    else
      looks = @looks.reject{|k,v| v == '0'}.keys
      @looks_name = looks.map { |k,v| Look.find(k).name }
      brands = Brand.includes(:look).where(look: looks)
      products_from_brand = Product.includes(:brand).where(brand: brands)
    end

    # if looks.include? '20'
    #   # Tous les looks
    #   @looks_name = [Look.find(20).name]
    #   products_from_brand = Product.includes(:brand).all
    # else
    #   @looks_name = looks.map { |k,v| Look.find(k).name }
    #   brands = Brand.includes(:look).where(look: looks)
    #   products_from_brand = Product.includes(:brand).where(brand: brands)
    # end

    products = products_from_brand

    products = products.where(category: category) unless category.blank?
    products = products.where(color: color) unless color.blank?
    unless size.blank?
      product_ids = Offer.search_engine_size(size).map(&:product_id)
      products = products.where(id: product_ids)
    end

    unless query.blank?
      products = products.search_engine(query)
    end

    @products = products.page(params[:page]).per(30)
    @total = @products.try(:total_count)
    @categories = Product.where(id: products_from_brand.map(&:id)).select(:category).map(&:category).uniq || []
    @colors = Product.where(id: products_from_brand.map(&:id)).select(:color).map(&:color).uniq || []
  end

end
