Rails.application.routes.draw do
  root 'posts#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :posts

  resources :users, only: [:show, :new, :create]
end
