Rails.application.routes.draw do
   
  resource :admin, controller: 'admin' do
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    # get 'settings/:action', controller: 'settings'
    
    
    post 'login', controller: 'admin', action: 'authenticate', on: :collection
    post 'signup', controller: 'admin', action: 'register', on: :collection
    post 'forgot', controller: 'admin', action: 'reset', on: :collection
    
    resource :settings do 
      resource :profiles, except: [:new, :edit, :create, :destroy]
      resources :users
      resources :roles do
        post 'sort', on: :collection
      end
      get ':action', on: :collection, as: 'action'
    end
    
    resource :contents do
      resources :banners do
        post 'sort', on: :collection
      end
      resources :videos do
        post 'sort', on: :collection
      end
      resources :news do
        post 'sort', on: :collection
        resources :images, only: [:create, :destroy]
      end
      resources :stories do
        post 'sort', on: :collection
        resources :images, only: [:create, :destroy]
      end
      resources :galleries do
        post 'sort', on: :collection
        resources :images, only: [:create, :destroy]
      end
      resources :events do
        post 'sort', on: :collection
        resources :images, only: [:create, :destroy]
      end
      resources :campaigns do
        post 'sort', on: :collection
        resources :images, only: [:create, :destroy]
      end

      resources :categories do
        post 'sort', on: :collection
      end

    end

    resource :store, controller: 'store' do      
      resources :products do
        post 'sort', on: :collection
        # get ':action', on: :collection, as: 'action'
        resources :images, only: [:create, :destroy]
      end

      resources :orders, except: [:new, :create, :destroy] do
        post 'cancel/:id', on: :collection, action: 'cancel', as: 'cancel'
        post 'revert/:id', on: :collection, action: 'revert', as: 'revert'
        post 'process/:id', on: :collection, action: 'do_process', as: 'process'
        get ':id/:action', on: :collection, as: 'action', id: nil
        
        get 'paid', action: 'paid', on: :collection, as: 'paid'
        get 'cancelled', action: 'cancelled', on: :collection, as: 'cancelled'
        get 'pending_payment', action: 'pending_payment', on: :collection, as: 'pending_payment'
      end
      
      resources :customers
      
      resources :shipping_fees do
        post 'sort', on: :collection
      end
    end
    
    resources :tags do
      post 'sort', on: :collection
    end
    
    resources :dashboards
    
    get ':action', controller: 'admin', on: :collection, as: 'action'
  end  
  
  resources :payments do
    collection do
      post :checkout
      post :receive_webhook
      post :notification
      get :success
    end
  end
  
  resource :accounts, controller: 'accounts', only: [:login, :register] do
    post 'login', controller: 'accounts', action: 'authenticate', on: :collection
    post 'signup', controller: 'accounts', action: 'register', on: :collection
    post 'forgot', controller: 'accounts', action: 'send_forgot', on: :collection
    post 'reset', controller: 'accounts', action: 'reset_password', on: :collection
    
    get 'logout', controller: 'accounts', action: 'logout',  on: :collection
    get 'login', controller: 'accounts', action: 'login', on: :collection
    get 'signup', controller: 'accounts', action: 'signup', on: :collection
    get 'forgot', controller: 'accounts', action: 'forgot', on: :collection
    get 'reset', controller: 'accounts', action: 'reset', on: :collection
    # get ':action', controller: 'accounts', on: :collection, as: 'action', except: ['authenticate', 'register', 'reset']
  end


  # post 'register', 
  # 
  # get 'login', controller: 'authenticate', action: 'login', as: 'authenticate_login'
  # get 'register', controller: 'authenticate', action: 'register', as: 'authenticate_register'
  
  get 'cart', controller: 'pages', action: 'cart', as: 'pages_cart'
  get 'modify_cart', controller: 'pages', action: 'modify_cart', as: 'pages_modify_cart'
  post ':lang/add_bracelet', controller: 'pages', action: 'add_bracelet', as: 'pages_add_bracelet'
  
  get ':lang/index', controller: 'pages', action: 'index', as: 'pages_index'
  get ':lang/journey', controller: 'pages', action: 'journey', as: 'pages_journey'
  get ':lang/people', controller: 'pages', action: 'people', as: 'pages_people'
  get ':lang/news', controller: 'pages', action: 'news', as: 'pages_news'
  get ':lang/events', controller: 'pages', action: 'events', as: 'pages_events'
  get ':lang/bracelet', controller: 'pages', action: 'bracelet', as: 'pages_bracelet'
  get ':lang/story', controller: 'pages', action: 'story', as: 'pages_story'
  get ':lang/story/:id', controller: 'pages', action: 'story_detail', as: 'pages_story_detail'
  post ':lang/story', controller: 'pages', action: 'share_story', as: 'pages_share_story'
  get ':lang/campaign', controller: 'pages', action: 'campaign', as: 'pages_campaign'
  get ':lang/contact', controller: 'pages', action: 'contact', as: 'pages_contact'
  
  get ':lang', controller: 'pages', action: 'index', as: 'pages_lang', :defaults => {:lang => "id"}
  
    
  # get ':controller/:action/:id'
  
  get '/', controller: 'pages', action: 'index', lang: 'id'
end
