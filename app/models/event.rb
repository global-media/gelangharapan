class Event < ActiveRecord::Base
  include Sort
  
  has_attached_file :image, :styles => { :medium => "300x300>", :small => "150x150>", :thumb => "100x100>" }, :default_url => "/system/defaults/no_image.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # validates :image, dimensions: { width: 600, height: 600 }
  
  validates_presence_of :title
  
  scope :active, -> { where("publish_at < NOW() AND (retract_at IS NULL OR retract_at > NOW())") }
  
  before_create :initialize_sort!
  
end
