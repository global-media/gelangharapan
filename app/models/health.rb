class Health < ActiveRecord::Base
  belongs_to :customer

  scope :active, -> { where("publish_at < NOW() AND (retract_at IS NULL OR retract_at > NOW()) AND status_id = 2").order("publish_at DESC") }

  STATUSES = {1 => 'Unmoderated',
              2 => 'Approved',
              3 => 'Hidden'}.freeze
  
  def status; STATUSES[status_id];  end

  def hide!;        update_attribute(:status_id, Health.hidden);       end
  def approve!;     update_attribute(:status_id, Health.approved);     end
  def unmoderate!;  update_attribute(:status_id, Health.unmoderated);  end

  def hidden?;      status_id == Health.hidden;        end
  def approved?;    status_id == Health.approved;      end
  def unmoderated?; status_id == Health.unmoderated;   end
  
  class << self
    def hide!(order_id);        Health.find(story_id).hide!;       end
    def approve!(order_id);     Health.find(story_id).approve!;    end
    def unmoderate!(order_id);  Health.find(story_id).unmoderate!; end

    def status_id?(status_name)
      STATUSES.detect {|k,v| v == status_name}.first || 1
    end

    def hidden;       Health.status_id?('Hidden');       end
    def approved;     Health.status_id?('Approved');     end
    def unmoderated;  Health.status_id?('Unmoderated');  end

    def all_statuses
      [hidden, approved, unmoderated]
    end
  end
  
  def short_question(num_chars=100)
    "#{question[0..(num_chars-1)]} #{'...' if question.size > num_chars}"
  end
  
  def short_answer(num_chars=100)
    "#{answer[0..(num_chars-1)]} #{'...' if answer.size > num_chars}"
  end
end
