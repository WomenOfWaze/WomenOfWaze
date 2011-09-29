class PhoneNumbersToStrings < ActiveRecord::Migration
  def up
    remove_column :enquiries, :phone_city_code
    remove_column :enquiries, :phone_country_code
    remove_column :enquiries, :phone_number
    add_column    :enquiries, :phone_number, :string
  end

  def down
    remove_column :enquiries, :phone_number
    add_column    :enquiries, :phone_city_code,    :integer
    add_column    :enquiries, :phone_country_code, :integer
    add_column    :enquiries, :phone_number,       :integer
  end
end
