module ProductsHelper
  def formatted_products products
    formatted = []
    b = []
    while !products.empty?
      b = products.take(4)
      formatted << b
      products = products - b
    end
    formatted
  end

  def fomatted_name name
     name.titleize
  end
  
end
