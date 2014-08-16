Rails.application.routes.draw do
  resources :items
  resources :categories
  resources :orders do
    get '/update_status' => 'orders#update_status', as: :update_status
    get '/cancel' => 'orders#cancel', as: :cancel
  end
  root to: 'categories#index'
end
