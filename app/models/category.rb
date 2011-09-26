class Category < ActiveRecord::Base
  has_many :sub_categories
  validates :name, :presence=>true , :uniqueness =>true
  validates :description, :presence=>true


  def self.list_all_details
    self.includes({:sub_categories => :products})
  end
end
