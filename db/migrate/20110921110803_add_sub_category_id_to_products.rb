class AddSubCategoryIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sub_category_id, :integer
  end
end
