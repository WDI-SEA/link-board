Rails.application.routes.draw do
  	
    root 'post#index'

    # get 'newPost' => 'post#new'

    post 'post/new' => 'post#create'

  	get 'signup' => 'user#new'
  	get 'Signup' => 'user#new'
  	post 'signup' => 'user#create'
  	post 'Signup' => 'user#create'

  	get 'login' => 'sessions#new'
  	get 'Login' => 'sessions#new'
	
	post 'login' => 'sessions#create'
	post 'Login' => 'sessions#create'
	
	delete 'logout' => 'sessions#destroy'

  post 'comment/new' => 'comment#create'

  resources :comment
  resources :post

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
