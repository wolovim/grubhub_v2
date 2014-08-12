Rails.application.routes.draw do
  resources :items, only: [:index]
  root to: 'items#index'
end
