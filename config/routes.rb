Rails.application.routes.draw do
  get 'users/sessions'

  get 'users/posts'

  get 'users/home'

  get 'users/comments'

  get 'signup' => 'users#new'

  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
