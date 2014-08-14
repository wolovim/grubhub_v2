Rails.application.routes.draw do
  resources :items
  resources :users,  only: [:new, :create]
  resources :addresses, only: [:new, :create, :index]

  root to: 'items#index'
end
