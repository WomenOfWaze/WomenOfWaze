class AddInquiryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :inquiry, :string
  end
end
