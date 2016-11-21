Rails.application.routes.draw do

  get 'post/:id' => 'comments#new'

  post 'comments' => 'comments#create'

  get 'comments/destroy'

  root 'main#index'


  get "signup" => 'users#new'

  post "signup" => 'users#create'

  get "login" => 'sessions#new'

  post "login" => 'sessions#create'

  delete "logout" => 'sessions#destroy'


  get 'posts' => 'posts#new'

  post 'postsnew' => 'post#create'

  delete "posts" => 'posts#destroy'

  get 'posts/edit'

  get 'posts/show'

  resources :posts do
  resources :comments
  member { post :vote }
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
