Rails.application.routes.draw do

  get 'login' => 'sessions#new'         #changed this from just: " get 'sessions/new' "
  get 'Login' => 'sessions#new'

  post 'login' => 'sessions#create'     #changed this from just: " get 'sessions/create' "
  post 'Login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy' #changed this from just: " get 'sessions/destroy' "


  root 'users#index'

  # post 'user/new'

  post  '/users/new', to: 'users#create'
  post  '/posts/new', to: 'posts#create'

  resources :users
  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
