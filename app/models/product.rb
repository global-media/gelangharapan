class Product < ActiveRecord::Base
  include Sort
  
  has_many :tag_relations, as: :content, inverse_of: :content  
  has_many :tags, through: :tag_relations
  
  has_attached_file :image, :styles => { :medium => "250x250>", :thumb => "125x125>" }, :default_url => "/system/defaults/no_image.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # validates :image, dimensions: { width: 1135, height: 524 }
  
  validates_presence_of :name, :base_price#, :base_sku
  # validates_uniqueness_of :name, :scope => [:base_sku]
  
  scope :active, -> { where("publish_at < NOW() AND (retract_at IS NULL OR retract_at > NOW())") }
  
  before_create :initialize_sort!
    
  def final_price
    sale_price || base_price
  end
  alias_method :product_final_price, :final_price
  
end
