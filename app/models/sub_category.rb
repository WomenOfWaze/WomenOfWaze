class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :products

  validates :name, :presence => { :message => "is required" },
            :uniqueness => { :message => "should be unique" },
            :length => { :maximum => 64, :message => "should not be more than 64 characters" }
  validates :description, :presence => { :message => "is required" },
            :length => { :maximum => 64, :message => "should not be more than 64 characters" }
end
