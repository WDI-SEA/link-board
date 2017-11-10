Rails.application.routes.draw do

  # get 'comments/create'
  #
  # get 'comments/new'
  #
  # get 'comments/edit'
  #
  # get 'comments/show'
  #
  # get 'comments/update'
  #
  # get 'comments/destroy'

  get 'post/create'

  get 'post/new'

  get 'post/edit'

  get 'post/show'

  get 'post/update'

  get 'post/destroy'

  get 'login' => 'sessions#new'         #changed this from just: " get 'sessions/new' "
  get 'Login' => 'sessions#new'

  post 'login' => 'sessions#create'     #changed this from just: " get 'sessions/create' "
  post 'Login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy' #changed this from just: " get 'sessions/destroy' "


  root 'users#index'

  # post 'user/new'

  post  '/users/new', to: 'users#create'
  post  '/posts/new', to: 'posts#create'
  post  '/comments/new', to: 'comments#create'
  put   '/comments/:id/edit' => 'comments#update'

  resources :users
  resources :posts
  resources :comments

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
