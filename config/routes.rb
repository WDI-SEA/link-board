Rails.application.routes.draw do
  root 'posts#index'

  # get 'posts/show'

  # get 'posts/edit'

  # get 'posts/new'

  # get 'users/index'

  # get 'users/show'

  # get 'users/edit'

  # get 'users/new'


 
  get "login" => 'sessions#new'
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"

  get "signup" => 'users#new'
  post 'signup' => "users#create"

  get "comments/:post_id" => "comments#index"
  post "comments" => "comments#create"
 
 get "profile" => "users#show"

  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
