Rails.application.routes.draw do

  root 'posts#index'

  get 'login' => 'session#new'

  post 'login' => 'session#create'

  get 'signup' => 'users#new'

  post 'signup' => 'users#create'

  post 'logout' => 'session#destroy'

  resources :posts
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
