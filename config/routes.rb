Rails.application.routes.draw do

  root 'posts#index'
  
  get 'signup' => 'users#new', as: 'users'
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get 'posts' => 'posts#new'
  post 'posts' => 'posts#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
