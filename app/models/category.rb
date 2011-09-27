class Category < ActiveRecord::Base
  has_many :sub_categories ,:order => "name ASC"
  validates :name, :presence=>true , :uniqueness =>true
  validates :description, :presence=>true


  def self.catalogue_details
    self.includes({:sub_categories => :products})
  end
end
