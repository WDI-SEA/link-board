Rails.application.routes.draw do
  # get 'posts/index'
  # get 'posts/new'

  # root 'home#index'
  root 'posts#index'

  get "login" => 'sessions#new'
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get "signup" => 'users#new'
  post 'signup' => "users#create"

  get "comments/:post_id" => "comments#index"
  post "comments" => "comments#create"

  resources :posts
  # resources :comments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
