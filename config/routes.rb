Rails.application.routes.draw do


  root 'posts#index'

  get 'posts/new' => 'posts#new'
  post 'posts' => 'posts#create'


  get 'signup' => 'user#new'
  post 'signup' => 'user#create'

  get "login" => 'sessions#new'
  post "login" => 'sessions#create'
  delete "logout" => 'sessions#destroy'

  # For details on the DSL available within this file, see http:#guides.rubyonrails.org#routing.html
  resources :posts
  resources :users
  resources :comments
end