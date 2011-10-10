Site::Application.routes.draw do

  resources :points

  resources :locations_users

  resources :locations_locationsets

  resources :locationsets_users

  resources :loactionsets_users

  resources :groups_locations

  resources :locationsets

  resources :groups_users

  resources :userparams

  resources :synthinstances

  resources :audiofiles

  resources :synths

  resources :groups

  match '/users/device_update/:id' => "users#update_2"

  match '/users/device_login' => "users#device_login"

  match '/users/device_logout/:id' => "users#device_logout"

  match '/users/device_edit/:id' => "users#device_edit"

  match '/users/device_create' => "users#device_create"

  match '/users/device_update_params/:id' => "users#device_update_params"

  match '/users/device_enter_location/:id' => "users#device_enter_location"

  match '/users/device_exit_location/:id' => "users#device_exit_location"

  match '/locations/device_create' => "locations#device_create"

  resources :users

  resources :locations

  get "home/index"

  match "/locations/download" => "locations#download", :as => :download
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
  root :to => "home#index"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
