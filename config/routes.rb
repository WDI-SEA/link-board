Rails.application.routes.draw do
  get 'profile' => 'user#index'

  get 'comments/new' => 'comments#new'

  post 'comments' => 'comments#create'

  get 'comments' => 'comments#show'

  root 'posts#index'

  get "posts/new" => 'posts#new'

  post "posts" => 'posts#create'

  get "signup" => 'user#new'

  post "signup" => 'user#create'

  get "login" => "sessions#new"

  post "login" => "sessions#create"
  
  delete "logout" => "sessions#destroy"

  get "modal" => 'partials#modal', :as => :modal

  resources :posts
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
