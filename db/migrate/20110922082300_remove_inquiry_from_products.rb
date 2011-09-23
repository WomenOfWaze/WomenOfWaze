class RemoveInquiryFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :inquiry
  end

  def down
    add_column :products, :inquiry, :string
  end
end
