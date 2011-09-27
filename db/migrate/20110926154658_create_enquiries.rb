class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :firstname, :null => false, :limit => 32
      t.string :lastname, :null => false, :limit => 32
      t.string :country
      t.integer :phone_country_code, :limit => 5
      t.integer :phone_city_code, :limit => 3
      t.integer :phone_number, :limit => 11
      t.string :email, :null => false, :limit => 65
      t.text :remarks, :null => false, :limit => 256

      t.timestamps
    end
  end
end
