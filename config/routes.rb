Rails.application.routes.draw do
  get 'comments/index'

  get 'comments/new'

  root 'posts#index'

  post '/comment' => 'comments#create'

  get 'posts/new' => "posts#new"

  post 'posts' => "posts#create"
  
  get 'signup' => 'users#new'

  post 'signup' => 'users#create'

  get "login" => 'sessions#new'

  post "login" => 'sessions#create'

  delete "logout" => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
