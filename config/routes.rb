Rails.application.routes.draw do
  get 'user/new'

  get 'post/index'

  get 'post/new'

  get 'post/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  get "login" => 'sessions#new'

  post "login" => 'sessions#create'

  delete "logout" => 'sessions#destroy'

  get "signup" => 'user#new'

  post "signup" => 'user#create'

  resources :sessions

end
