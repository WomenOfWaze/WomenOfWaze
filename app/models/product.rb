class Product < ActiveRecord::Base
  include Mixins::PaperclipStorageDecider
  
  belongs_to :sub_category
 
  has_attached_file :photo

  validates :name, :presence=>{ :message => "is required" }
  validates :description, :presence=>{ :message => "is required" }
  validates :price, :presence=>{ :message => "is required" }
  validates :size, :presence=>{ :message => "is required" }
  validates_attachment_presence :photo, :message => "=> Please upload the avatar file"
  validates_attachment_size :photo, :less_than => 5.megabytes, :message => "should be less than 5MB"
  validates_attachment_content_type :photo, :content_type => ["image/gif","image/jpg","image/jpeg","image/png"], :message => 'invalid format'

  def self.generate_code(product_id)
    "#{10000 + (product_id)}"
  end

end
