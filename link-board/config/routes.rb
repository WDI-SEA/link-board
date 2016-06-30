Rails.application.routes.draw do
  

  # GET /signup users#new render user sign up form
  get 'signup' => 'user#new'
  # POST  /signup users#create  create user in database (signup)
  post 'signup'=> 'user#create'

  # GET /login  sessions#new  render user log in form
  get 'login' => 'sessions#new'
  # POST  /login  sessions#create create user session (login)
  post 'login' => 'sessions#create'
  # DELETE  /logout sessions#destroy  destroy user session (logout)
  get 'logout' => 'sessions#destroy'

  # GET / posts#index render list of all posts
  root 'posts#index'
  # GET /posts/new  posts#new render add post form
  get 'posts'  => 'posts#new'
 
  # GET show single post
  get 'posts/:id'=> 'posts#show'

  post 'posts/:post_id' => 'comments#create'

  # POST  /posts  posts#create  create post in database (associated to logged in user)
  post 'posts' => 'posts#create'




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
