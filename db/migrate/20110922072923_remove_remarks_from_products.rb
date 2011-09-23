class RemoveRemarksFromProducts < ActiveRecord::Migration
  def up
    remove_column :products, :remarks
  end

  def down
    add_column :products, :remarks, :string
  end
end
