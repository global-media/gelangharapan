module ApplicationHelper
  include Rack::Recaptcha::Helpers

  def english?
    params[:lang] == 'en'
  end
  
  def indonesian?
    params[:lang] == 'id'
  end
  
  protected
  
    def default_options(options)
      options[:max] ||= 5
      options[:class] ||= "col-md-15 col-sm-6"
      options
    end
end
