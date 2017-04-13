Rails.application.routes.draw do

  root 'posts#index'

  get 'posts/new' => 'posts#new'

  post 'posts/new' => 'posts#create'

  get 'comments/:post_id' => 'comments#index'

  post 'comments' => 'comments#create'

  get 'signup' => 'users#new'

  post 'signup' => 'users#create'

  get 'profile' => 'users#show'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :comments

end
