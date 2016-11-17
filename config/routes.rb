Rails.application.routes.draw do
  root 'posts#index'

  get 'posts/new' => 'posts#new'

  post 'posts/posts' => 'posts#create'

  get 'posts/edit' => 'posts#edit'

  put 'postsupdate' => 'posts#update'

  delete 'posts/delete' => 'posts#destroy'

  get 'signup' => 'users#new'

  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
