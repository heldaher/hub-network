Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :posts, except: :show

  resources :users, only: [:new, :create]
end
