class GenericAdapter


  def open_feed
    raise NoMethodError, "You must defined how to open the document"
  end

  def valid?(object)
    true
  end

  def ean(object)
    ""
  end

  def title(object)
    ""
  end

  def image(object)
    ""
  end

  def link(object)
    ""
  end

  def description(object)
    ""
  end

  def price(object)
    ""
  end

  def color(object)
    ""
  end

  def brand(object)
    ""
  end

  def category(object)
    ""
  end

  def size(object)
    ""
  end

  def parse(object)
      data = {}
      data[:ean] = self.ean(object)
      data[:image] = self.image(object)
      data[:title] = self.title(object)
      data[:link] = self.link(object)
      data[:description] = self.description(object)
      data[:price] = self.price(object)
      data[:color] = self.color(object)
      data[:brand] = self.brand(object)
      data[:category] = self.category(object)
      data[:size] = self.size(object)

      return data
  end

end
