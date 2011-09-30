module ProductsHelper
  def formatted_products products
    formatted = []
    b = []
    while !products.empty?
      b = products.take(4)
      products = products - b
      size = b.size
      (4 - size).times {b << "1"} if size < 4
      formatted << b
    end
    formatted
  end

  def formatted_name name
     name.titleize
  end

   def formatted_description text
     text.capitalize
  end
  
end
