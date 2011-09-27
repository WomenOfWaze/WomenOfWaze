class SubCategory < ActiveRecord::Base
  belongs_to :category
  has_many :products ,:order => "price DESC"
  validates :name, :presence=>true 
  validates :description, :presence=>true
end
