Rails.application.routes.draw do
  root 'main#index'

  get 'login' || 'Login' => 'sessions#new'         #changed this from just: " get 'sessions/new' "
  get 'Login' => 'sessions#new'

  post 'login' => 'sessions#create'     #changed this from just: " get 'sessions/create' "
  post 'Login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy' #changed this from just: " get 'sessions/destroy' "

  resources :user

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
