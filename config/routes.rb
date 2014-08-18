Rails.application.routes.draw do
  resources :items
  resources :categories
  resources :orders do
    get '/update_status' => 'orders#update_status', as: :update_status
    get '/cancel' => 'orders#cancel', as: :cancel
    get '/remove_item/:item_id' => 'orders#remove_item', as: :remove_item
  end
  get '/ordered' => 'orders#ordered', as: :ordered
  get '/paid' => 'orders#paid', as: :paid
  resources :order_items, only: [:destroy, :update]
  root to: 'categories#index'
end
