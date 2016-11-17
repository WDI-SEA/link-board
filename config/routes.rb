Rails.application.routes.draw do
  get 'posts/edit'

  get 'posts/show'

  root 'posts#index'

  get 'posts/new' => 'posts#new'

  post 'posts/' => 'posts#create'

  #root 'home#index'

  get "login" => 'sessions#new'

  post "login" => 'sessions#create'

  delete "logout" => 'sessions#destroy'


  resources :posts, :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
