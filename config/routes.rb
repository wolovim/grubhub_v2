Rails.application.routes.draw do
  resources :items
  resources :categories
  root to: 'items#index'
end
