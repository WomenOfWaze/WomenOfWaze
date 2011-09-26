class AddNewArrivalToProducts < ActiveRecord::Migration
  def change
    add_column :products, :new_arrival, :string
  end
end
