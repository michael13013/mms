require "nokogiri"
require "open-uri"


class EffiliationAdapter < GenericAdapter

  def open_feed(url)
    data = Nokogiri::XML(open(url))
    docs = data.xpath('//products/product')
  end

  def valid?(input)
    return false if self.image(input).include?("placeholder")
    return false if self.image(input).include?("placeholder")
    return false if self.image(input).nil?
    return false if self.ean(input).empty?
    # return true unless self.gender(input).include?("Homme")
    return true
  end

  def title(input)
    data_from_path(input, "name")
  end

  def ean(input)
    data_from_path(input, "upc")
  end

  def image(input)
    data_from_path(input, "url_image")
  end

  def link(input)
    data_from_path(input, "url_product")
  end

  def description(input)
    data_from_path(input, "description")
  end

  def price(input)
    data_from_path(input, "price").to_i
  end

  def size(input)
    data_from_path(input, "size")
  end

  def color(input)
    data_from_path(input, "extras colour")
  end

  def brand(input)
    data_from_path(input, "brand")
  end

  def category(input)
    data_from_path(input, "type")
  end

  private

  def data_from_path(object, path)
    if object.css(path).first.nil?
      return ""
    else
      return object.css(path).first.content.strip
    end
  end


end
