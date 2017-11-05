Rails.application.routes.draw do
  get 'posts/edit'

  get 'posts/index'

  get 'posts/new'

  get 'posts/show'

  get 'posts' => 'posts#index'

  root 'main#index'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  get 'logout' => 'sessions#destroy'

  resources :user
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
