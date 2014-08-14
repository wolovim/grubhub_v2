Rails.application.routes.draw do
  resources :items
  resources :categories
  resources :orders do
    get '/update_status' => 'orders#update_status', as: :update_status
    get '/cancel' => 'orders#cancel', as: :cancel
    get '/remove_item/:item_id' => 'orders#remove_item', as: :remove_item
  end
  resources :order_items, only: [:destroy, :update]
  resources :users,  only: [:new, :create]
  resources :addresses, only: [:new, :create, :index]

  root to: 'categories#index'
end
