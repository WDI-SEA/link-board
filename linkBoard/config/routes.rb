Rails.application.routes.draw do
  get 'user/new'

  get 'user/create'

  root 'main#index'

  # get 'sessions/new'
  get 'session' => 'sessions#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  get 'signup' => 'sessions#signup'
  post 'signup' => 'sessions#signup_create'

  get 'logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
