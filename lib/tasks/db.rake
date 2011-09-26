namespace :db do

  desc "populate Categories"
  task :populate_categories => [:environment] do
    category = ['Jute Bags','Denim Bags']
    category.each do |ct|
      Category.create(:name => "#{ct}" ,:description => "This is the Description of category-#{ct}")
    end
  end

  desc "populate sub_categories"
  task :populate_sub_categories => [:environment] do
    a = Category.all
    sub_category = ['Sub Category 11','Sub Category 12']
    a.each do |i|
      sub_category.each do |st|
        SubCategory.create(:name => "#{st}" ,:description => "This is the Description of sub category-#{st}",:category_id => "#{i.id}")
      end
    end
  end

  desc "populate products"
  task :populate_products => [:environment] do
    p = 1
    a = SubCategory.all
    product_photo = ["127541163.jpg", "128610707.jpg", "129893431.jpg", "131419725.jpg"]
    a.each do |i|
      product_photo.each do |pt|
        Product.create(:name => "Product-#{p}" ,:code => "#{1000+p}" ,:description => "This is the description of product-#{p}",:price => 23.0,:sub_category_id =>i.id,:size => "#{p*3}",:photo_file_name =>"#{pt}",:photo_content_type => "image/jpeg",:photo_updated_at => Time.now,:new_arrival => "1")
        p+=1
      end
    end
  end
  task :load => [ :populate_categories, :populate_sub_categories ,:populate_products]
end