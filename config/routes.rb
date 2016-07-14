Rails.application.routes.draw do
  root 'main#index'

  get 'profile', to: 'users#show'
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'posts/new', to: 'posts#new'
  post 'posts/new', to: 'posts#create'
  # resources :posts, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
