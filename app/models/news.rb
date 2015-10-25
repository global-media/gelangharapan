class News < ActiveRecord::Base
  include Sort
    
  validates_presence_of :title
  
  scope :active, -> { where("publish_at < NOW() AND (retract_at IS NULL OR retract_at > NOW())") }
  
  before_create :initialize_sort!

end
