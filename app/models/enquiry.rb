class Enquiry < ActiveRecord::Base
  validates :firstname, :presence => { :message => "is required" }, :length => { :maximum => 32, :message => "should not be more than 32 characters" }
  validates_format_of :firstname, :with => /^\w+$/,  :message => "cannot contain special characters." #if @firstname_params.nil?
  validates_format_of :lastname, :with => /^\w+$/,  :message => "cannot contain special characters." #if @enquiry
  validates :lastname, :presence => true, :length => { :maximum => 32, :message => "should not be more than 32 characters" }
  validates :email, :presence => true, :length => { :maximum => 64, :message => "should not be more than 64 characters" }
  validates :remarks, :presence => true, :length => { :maximum => 256, :message => "should not be more than 256 characters" }
 # validates :country, :allow_blank => true
  validates :phone_number, :length => { :maximum => 20, :message => "should not be more than 20 characters" }
end
