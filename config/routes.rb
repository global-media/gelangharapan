Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  
  # =========================================
  # =========================================
  # =========================================
    
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

      resources :categories do
        post 'sort', on: :collection
      end
    end

    resource :store, controller: 'store' do      
      resources :orders, except: [:new, :create, :destroy] do
        post 'cancel/:id', on: :collection, action: 'cancel', as: 'cancel'
        post 'revert/:id', on: :collection, action: 'revert', as: 'revert'
        post 'process/:id', on: :collection, action: 'do_process', as: 'process'
        get ':id/:action', on: :collection, as: 'action', id: nil
      end
      
      resources :customers
    end
    
    resources :tags do
      post 'sort', on: :collection
    end
    
    resources :dashboards
    
    get ':action', controller: 'admin', on: :collection, as: 'action'
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
  
  post ':lang/add_bracelet', controller: 'pages', action: 'add_bracelet', as: 'pages_add_bracelet'
  get ':lang/modify_bracelet', controller: 'pages', action: 'modify_bracelet', as: 'pages_modify_bracelet'
  
  get ':lang/index', controller: 'pages', action: 'index', as: 'pages_index'
  get ':lang/journey', controller: 'pages', action: 'journey', as: 'pages_journey'
  get ':lang/people', controller: 'pages', action: 'people', as: 'pages_people'
  get ':lang/news', controller: 'pages', action: 'news', as: 'pages_news'
  get ':lang/events', controller: 'pages', action: 'events', as: 'pages_events'
  get ':lang/bracelet', controller: 'pages', action: 'bracelet', as: 'pages_bracelet'
  get ':lang/story', controller: 'pages', action: 'story', as: 'pages_story'
  get ':lang/contact', controller: 'pages', action: 'contact', as: 'pages_contact'
  get ':lang/cart', controller: 'pages', action: 'cart', as: 'pages_cart'
  
  get ':lang', controller: 'pages', action: 'index', as: 'pages_lang', :defaults => {:lang => "id"}
  
    
  # get ':controller/:action/:id'
  
  get '/', controller: 'pages', action: 'index', lang: 'id'
end
