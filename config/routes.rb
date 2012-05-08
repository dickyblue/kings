NickMing::Application.routes.draw do

  root :to => 'sessions#index'

  match '/login', :to => 'sessions#new', :as => :login
  match '/signout', :to => 'sessions#destroy', :as => :sign_out

  match '/pages/how_we_met', :to => 'pages#how_we_met', :as => :how_we_met
  match '/pages/then_and_now', :to => 'pages#then_and_now', :as => :then_and_now
  match '/pages/she_said_yes', :to => 'pages#she_said_yes', :as => :she_said_yes
  match '/pages/weekend_schedule', :to => 'pages#weekend_schedule', :as => :weekend_schedule


  match '/welcome', :to => 'galleries#home', :as => :welcome
  match '/galleries/manage', :to => 'galleries#manage', :as => :manage_gallery
  match '/galleries/list', :to => 'galleries#list', :as => :list_gallery

  match '/users/manage', :to => 'users#manage', :as => :manage_user
  match '/users/list', :to => 'users#list', :as => :list_user
  
  resources :galleries, :sessions, :users

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
