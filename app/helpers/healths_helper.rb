module HealthsHelper
  def health_status_options
    Health::STATUSES.collect {|k,v| [v, k]}
  end
end
