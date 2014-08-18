Rails.application.routes.draw do

  resources :items
  resources :users,     only: [:new, :create]
  resources :addresses, only: [:new, :create, :index]

  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'items#index'
end
