Rails.application.routes.draw do
  resources :items, only: [:index, :show]
  root to: 'items#index'
end
