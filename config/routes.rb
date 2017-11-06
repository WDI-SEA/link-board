Rails.application.routes.draw do
  root "main#index"

  get "login" => 'sessions#new'

  post 'sessions#create'

  delete 'sessions#destroy'

  get 'about' => "main#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
