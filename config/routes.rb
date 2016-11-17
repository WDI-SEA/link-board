Rails.application.routes.draw do
  root 'main#index'

  get 'index' => 'posts#index'

  get "login" => 'sessions#new'

  post "login" => 'sessions#create'

  delete "logout" => 'sessions#destroy'

  get 'posts/index'

  get 'posts/new'

  get 'posts/edit'

  get 'posts/show'

  resources :posts

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
