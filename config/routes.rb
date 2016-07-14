Rails.application.routes.draw do
  root 'posts#index'

  get 'signup', to: 'users#new', as: 'users'
  post 'signup', to: 'users#create'

  get 'posts', to: 'posts#new'
  post 'posts', to: 'posts#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy' 
  
end
