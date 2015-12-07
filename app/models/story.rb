class Story < ActiveRecord::Base
  include Sort
  
  belongs_to :customer

  scope :active, -> { where("publish_at < NOW() AND (retract_at IS NULL OR retract_at > NOW()) AND status_id = 2").order("publish_at DESC, sort ASC") }
  
  before_create :initialize_sort!
  
  STATUSES = {1 => 'Unmoderated',
              2 => 'Approved',
              3 => 'Hidden'}.freeze
  
  def status; STATUSES[status_id];  end

  def hide!;        update_attribute(:status_id, Story.hidden);       end
  def approve!;     update_attribute(:status_id, Story.approved);     end
  def unmoderate!;  update_attribute(:status_id, Story.unmoderated);  end

  def hidden?;      status_id == Story.hidden;        end
  def approved?;    status_id == Story.approved;      end
  def unmoderated?; status_id == Story.unmoderated;   end
  
  class << self
    def hide!(order_id);        Story.find(story_id).hide!;       end
    def approve!(order_id);     Story.find(story_id).approve!;    end
    def unmoderate!(order_id);  Story.find(story_id).unmoderate!; end

    def status_id?(status_name)
      STATUSES.detect {|k,v| v == status_name}.first || 1
    end

    def hidden;       Story.status_id?('Hidden');       end
    def approved;     Story.status_id?('Approved');     end
    def unmoderated;  Story.status_id?('Unmoderated');  end

    def all_statuses
      [hidden, approved, unmoderated]
    end
  end
  
  def short_post(num_chars=100)
    "#{post[0..(num_chars-1)]} #{'...' if post.size > num_chars}"
  end
  
end
