Rails.application.routes.draw do
  resources :items, except: [:destroy]
  root to: 'items#index'
end
