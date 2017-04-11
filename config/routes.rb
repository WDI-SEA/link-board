Rails.application.routes.draw do

  root 'post#index'

  # get 'post/show' => 'post#show'

  # get 'post/edit' => 'post#edit'

  get 'signup' => 'user#new'

  post 'signup' => 'user#create'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  # get 'user/edit' => 'user#edit'

  # post 'user/edit' => 'user#update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :post
  resources :user
  resources :sessions
end
