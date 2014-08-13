Rails.application.routes.draw do
  resources :items
  resources :categories
  resources :orders
  root to: 'items#index'
end
