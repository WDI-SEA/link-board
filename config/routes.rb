Rails.application.routes.draw do
  root 'post#index'

  post 'post/new'=>'post#create'

  get 'login' => "sessions#new"

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  resources :user
  resources :post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
