Rails.application.routes.draw do
  
  root 'posts#index'
  
    get 'login'  => 'sessions#new'         #changed this from just: " get 'sessions/new' "
    
  
    post 'login' => 'sessions#create'     #changed this from just: " get 'sessions/create' "

    post 'posts/new'=>'posts#create'
    
  
    delete 'logout' => 'sessions#destroy' #changed this from just: " get 'sessions/destroy' "
  
    resources :user
    resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
