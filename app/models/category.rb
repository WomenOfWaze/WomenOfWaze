class Category < ActiveRecord::Base
  has_many :sub_categories
  
  validates :name, :presence => { :message => "is required" } ,
            :uniqueness => { :message => "should be unique" }, 
            :length => { :maximum => 64, :message => "should not be more than 64 characters" }
  validates :description, :presence => { :message => "is required" }, 
            :length => { :maximum => 64, :message => "should not be more than 64 characters" }


  def self.list_all_details
    self.includes({:sub_categories => :products})
  end
end
