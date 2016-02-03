Kings::Application.routes.draw do

  root :to => 'pages#home'

  match '/login', :to => 'sessions#new', :as => :login, via: [:get]
  match '/signout', :to => 'sessions#destroy', :as => :sign_out, via: [:get, :post]

  match '/galleries/index2', :to => 'galleries#index2', :as => :index2_gallery, via: [:get]
  match '/galleries/engagement', :to => 'galleries#engagement', :as => :engagement, via: [:get]
  match '/galleries/travel', :to => 'galleries#travel_images', :as => :travel_images, via: [:get]
  match '/galleries/wedding', :to => 'galleries#wedding', :as => :wedding, via: [:get]


  match '/galleries/manage', :to => 'galleries#manage', :as => :manage_gallery, via: [:get, :post]
  match '/galleries/list', :to => 'galleries#list', :as => :list_gallery, via: [:get, :post]
  post  '/galleries/wedding_photos', :to => 'comments#create_gallery_comment', :as => :create_gallery_comment, via: [:get, :post]
  post  '/travels/:id', :to => 'comments#create_travel_comment', :as => :create_travel_comment, via: [:get, :post]
  post  '/foods/:id', :to => 'comments#create_food_comment', :as => :create_food_comment, via: [:get, :post]

  match '/users/manage', :to => 'users#manage', :as => :manage_user, via: [:get, :post]
  match '/users/list', :to => 'users#list', :as => :list_user, via: [:get, :post]
  
  match '/travels/manage', :to => 'travels#manage', :as => :manage_travel, via: [:get, :post]
  match '/travels/list', :to => 'travels#list', :as => :list_travel_blogs, via: [:get, :post]

  match '/foods/manage', :to => 'foods#manage', :as => :manage_food, via: [:get, :post]
  match '/foods/list', :to => 'foods#list', :as => :list_food_blogs, via: [:get, :post]

  match '/quotes/manage', :to => 'quotes#manage', :as => :manage_quote, via: [:get, :post]
  match '/quotes/list', :to => 'quotes#list', :as => :list_quotes, via: [:get, :post]
  
  resources :galleries, :sessions, :users, :admins, :comments, :travels, :foods, :quotes
  

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
