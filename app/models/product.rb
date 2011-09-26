class Product < ActiveRecord::Base
  #  after_save :generate_code

  belongs_to :sub_category
  #Paperclip interpolation
  Paperclip.interpolates :image_file_name do |attachment, style|
    attachment.instance.image_file_name

  end
  has_attached_file :photo,
    :url => "images/:attachment/:image_file_name",
    :path => ":rails_root/public/assets/images/:attachment/:image_file_name"
 

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

  #Generate image file name
  def image_file_name
    self.photo_file_name
  end

end