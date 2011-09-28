class Product < ActiveRecord::Base
  include Mixins::PaperclipStorageDecider

  belongs_to :sub_category

  has_attached_file :photo,@paperclip_storage
    
    
  validates :name, :presence=>{ :message => "is required" },
    :uniqueness => { :message => "should be unique" },
    :length => { :maximum => 64, :message => "should not be more than 64 characters" }
  validates :description, :presence=>{ :message => "is required" },
    :length => { :maximum => 256, :message => "should not be more than 256 characters" }
  validates :price, :presence=>{ :message => "is required" },
    :length => { :maximum => 10, :message => "should not be more than 10 digits" },
    :numericality => true
  validates :size, :presence=>{ :message => "is required" },
    :length => { :maximum => 15, :message => "should not be more than 15 characters" }
  validates_attachment_presence :photo, :message => "=> Please upload the avatar file"
  validates_attachment_size :photo, :less_than => 5.megabytes, :message => "should be less than 5MB"
  validates_attachment_content_type :photo, 
    :content_type => ["image/gif","image/jpg","image/jpeg","image/png","image/pjpeg"],
    :message => 'invalid format'

  def is_new_arrival?
    new_arrival == "1"
  end

  def self.generate_code(product_id)
    "#{10000 + (product_id)}"

  end
end
