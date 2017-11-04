Rails.application.routes.draw do
  	
  	get 'signup' => 'user#new'
  	get 'Signup' => 'user#new'
  	post 'signup' => 'user#create'
  	post 'Signup' => 'user#create'

  	get 'login' => 'sessions#new'
  	get 'Login' => 'sessions#new'
	
	post 'login' => 'sessions#create'
	post 'Login' => 'sessions#create'
	
	delete 'logout' => 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
