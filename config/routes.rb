Rails.application.routes.draw do
  get 'posts/index'

  get 'posts/new'

  get 'posts/create'

  get "posts/show/:id" => "posts#show"

  root 'home#index'

  get "signup" => "users#new"

  post "signup" => "users#create"

  get "login" => 'sessions#new'

  post "login" => 'sessions#create'

  delete "logout" => 'sessions#destroy'

  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
