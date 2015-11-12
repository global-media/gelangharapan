class ApplicationController < ActionController::Base
  include Rack::Recaptcha::Helpers
  
  SITE_URL = '/'.freeze
  SITE_NAME = 'Hope'.freeze
  SITE_ICON = 'img/logo.png'.freeze
  SITE_LOGO = 'img/logo.png'.freeze
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # before_filter :authorize, except: [:login, :logout, :authenticate, :help, :register, :registration, :forgot, :reset, :signup]
  # 
  # before_filter :validate_permission, except: [:profile, :login, :logout, :authenticate, :help, :register, :registration, :forgot, :reset, :signup]

  protected
    
    def user_params
      params.require(:user).permit!
    end
    
    def customer_params
      params.require(:customer).permit!
    end
     
    def admin_authorize
      if !admin_logged_in?
        redirect_to action_admin_url(action: 'login') and return
      end
    end
      
    def admin_logged_in?
      !session[:user].blank?
    end
    helper_method :admin_logged_in?
    
    def authorize
      if !logged_in?
        redirect_to '/' and return
      end
    end
      
    def logged_in?
      !session[:customer].blank?
    end
    helper_method :logged_in?
    
    def initialize_cart
      session[:cart] = {}
    end
    
    def cart
      session[:cart] ||= {}
    end
    helper_method :cart
    
    def customer
      session[:customer] ||= {}
    end
    helper_method :customer
    
    def validate_login
      return true if logged_in?
      flash[:error] = 'Please login first'
      session[:redirect_to] = (request.get? ? request.url : request.referrer)
      redirect_to login_accounts_url and return false
    end

    def validate_admin_permission
      return false unless admin_logged_in?
      paths = request.path.split('/')[1..-1]
      
      if role = User.find(session[:user]['id']).role
        return true if role.permissions == 'all'
        while(true)
          break unless route_path = paths.delete_at(0)
          return true if role.permissions.split(',').detect {|perm| perm.strip == route_path}
        end unless role.permissions.blank?
      end
      
      redirect_to admin_home_url and return false
    end
    # helper_method :validate_admin_permission

    def admin_home_url
      return admin_contents_news_index_url unless request.path == '/admin/contents/news'
      return '/'
    end
    
    def verify_url?(identifier)
      params[:h] == Customer.hashify(params[identifier])
    end

    def redirect_to_url
      url = session[:redirect_to]
      session[:redirect_to] = nil
      url || :back
    end
end
