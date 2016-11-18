Rails.application.routes.draw do

  root 'home#index'

  post "/" => "home#create"

  post "/comment" => "home#create_comment"

  delete "/remove/:id" => "home#destroy"

  get 'signup' => "users#new"

  post 'signup' => "users#create"

  get "login" => 'sessions#new'

  post "login" => 'sessions#create'

  delete "logout" => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
