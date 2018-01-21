Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :users, only: [:new, :create]
  resources :entregas, only: [:create, :update]

  resources :user_sessions, only: [:create, :destroy]
  
  resources :demands, only: [:create]
  resources :offers, only: [:create]
  
  get '/demand/details/:id', to: 'static_pages#demand'
  get '/demand/update/:id', to: 'static_pages#demand_update'
  get '/demand/type/:tipo', to: 'static_pages#index'
  get '/demand/details/:id/:detail', to: 'demands#demand_details'
  get '/details/partial/:partial/:id', to: 'static_pages#partials'
  get '/offer/details/:id', to: 'static_pages#offer'
  get '/user/index', to: 'users#index'
  
  delete '/sign_out', to: 'user_sessions#destroy', as: :sign_out
  get '/sign_in', to: 'user_sessions#new', as: :sign_in
  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'static_pages#index'
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
end
