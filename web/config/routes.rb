Rails.application.routes.draw do
  # get 'game/new', to: 'game#new'
  # post 'game/create', to: 'game#create'
  # get 'game/show/:id', to: 'game#show'
  # put 'game/update', to: 'game#update'


  # GET 'games' - index
  # GET 'games/new' - new
  # POST 'games' - create
  # GET 'games/3' - show
  # PUT 'games/3' - update
  # DELETE 'games/3' - destroy

  # resources :games, :only => [:new, :create, ...]
  # resources :games, :except => [:index, :destroy]
  # get 'games', to: 'games#index'
  # localhost:3000/games/new
  # params = { id => new }
  root 'games#index'
  get 'games/new', to: 'games#new'
  get 'games/:id', to: 'games#show'
  put 'games/:id', to: 'games#update'
  get 'games/winner/:id',to: 'games#winner' 
  post 'games/create', to: 'games#create'
  # delete 'games/:id', to: 'games#destroy'

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
end
