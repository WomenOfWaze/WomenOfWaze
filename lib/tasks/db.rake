namespace :db do

  desc "populate Categories"
  task :populate_categories => [:environment] do
    Category.delete_all
    category = ['Jute Bags','Denim Bags']
    category.each do |ct|
      Category.create(:name => "#{ct}" ,:description => "This is the Description of category-#{ct}")
    end
  end

  desc "populate sub_categories"
  task :populate_sub_categories => [:environment] do
    SubCategory.delete_all
    Category.all.each do |category|
      ['Sub Category 11','Sub Category 12'].each do |subcategory_name|
        SubCategory.create(
          :name => "#{subcategory_name}",
          :description => "This is the Description of sub category-#{subcategory_name}",
          :category => category
        )
      end
    end
  end

  desc "populate products"
  task :populate_products => [:environment] do
    Product.delete_all
    sample_bag_blue = File.new(File.join(Rails.root, 'spec', 'fixtures', 'sample_bag_photos', 'sample_bag_blue.jpg'))
    sample_bag_red =  File.new(File.join(Rails.root, 'spec', 'fixtures', 'sample_bag_photos', 'sample_bag_red.jpg'))
    SubCategory.all.each do |subcategory|
      4.times do |count|
        Product.create(
          :name => "Product-#{count}",
          :code => "#{1000+count}",
          :description => "This is the description of product-#{count}",
          :price => 23.0,
          :sub_category => subcategory,
          :size => "#{count*3}",
          :new_arrival => "1",
          :photo => count.even? ? sample_bag_blue : sample_bag_red
        )
      end
    end
  end
  task :load => [ :populate_categories, :populate_sub_categories ,:populate_products]
end
