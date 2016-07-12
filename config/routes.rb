Rails.application.routes.draw do
  
  get 'sessions/new'

  root 'main#index'

# we're only going to use these two routes for now
  # resources :users, only: [:new, :create]

  # changing the url from /users/new to /signup
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # we don't want to use resources because we want to name the routes more accurately

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

end
