class Banner < ActiveRecord::Base
  include Sort
  
  has_many :images
  
  has_attached_file :image, :styles => { :medium => "568x262>", :small => "284x131>", :thumb => "142x66>" }, :default_url => "/system/defaults/no_image.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # validates :image, dimensions: { width: 1135, height: 524 }
  
  validates_presence_of :name#, :link_url, :publish_at, :retract_at
  
  scope :active, -> { where("publish_at < NOW() AND (retract_at IS NULL OR retract_at > NOW())") }

  before_create :initialize_sort!

end
