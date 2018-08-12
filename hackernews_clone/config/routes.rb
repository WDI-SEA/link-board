Rails.application.routes.draw do

  root 'posts#index'

  get "posts/new" => 'posts#new'

  post "posts" => 'posts#create'

  get "signup" => 'users#new'

  post "signup" => 'users#create'

  get "login" => "sessions#new"

  post "login" => "sessions#create"
  
  delete "logout" => "sessions#destroy"


  resources :posts

end
