module StoriesHelper
  def story_status_options
    Story::STATUSES.collect {|k,v| [v, k]}
  end
end
