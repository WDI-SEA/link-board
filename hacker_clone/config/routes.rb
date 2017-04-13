Rails.application.routes.draw do



  root 'posts#index'
  get 'post/:id' => "posts#show"
  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
  get 'signup' => "users#new"
  post 'signup' => "users#create"
  get 'users/show' => "users#show"
  get 'users/edit' => "users#edit"
  post 'users/edit' => "users#update"
  post 'posts/new' => 'posts#create'

  resources :posts
  resources :comments

end
