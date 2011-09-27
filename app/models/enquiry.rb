class Enquiry < ActiveRecord::Base
  validates :firstname, :presence => true, :length => { :maximum => 32 }
  validates_format_of :firstname, :with => /^\w+$/,  :message => "cannot contain special characters." #if @firstname_params.nil?
  validates_format_of :lastname, :with => /^\w+$/,  :message => "cannot contain special characters." #if @enquiry
  validates :lastname, :presence => true, :length => { :maximum => 32 }
  validates :email, :presence => true, :length => { :maximum => 64 }
  validates :remarks, :presence => true, :length => { :maximum => 256 }
 # validates :country, :allow_blank => true
  validates :phone_number, :length => { :maximum => 12 }
  validates :phone_country_code, :length => { :maximum => 5 }
  validates :phone_city_code, :length => { :maximum => 3 }
end
