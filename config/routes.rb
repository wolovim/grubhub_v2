Rails.application.routes.draw do

  root to: 'categories#index'

  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # resources :items
  resources :categories
  resources :order_items, only: [:destroy, :update]
  resources :users,  only: [:new, :create, :show]
  resources :addresses, only: [:new, :create, :index]
  resource :cart, only: [:show, :update]

  resources :orders do
    get '/update_status' => 'orders#update_status', as: :update_status
    get '/cancel' => 'orders#cancel', as: :cancel
    get '/remove_item/:item_id' => 'orders#remove_item', as: :remove_item
  end

  get '/ordered' => 'orders#ordered', as: :ordered
  get '/paid' => 'orders#paid', as: :paid
  get '/completed' => 'orders#completed', as: :completed
  get '/cancelled' => 'orders#cancelled', as: :cancelled

  namespace :admin do
    resources :items do
      get '/delete_category/:category_id' => 'items#delete_category', as: :delete_category
      get '/add_category/:category_id' => 'items#add_category', as: :add_category
    end
    resources :categories
    resources :order_items, only: [:destroy, :update]
    resources :users,  only: [:new, :create]
    resources :addresses, only: [:new, :create, :index]
  	resources :orders do
	    get '/update_status' => 'orders#update_status', as: :update_status
	    get '/cancel' => 'orders#cancel', as: :cancel
	    get '/remove_item/:item_id' => 'orders#remove_item', as: :remove_item
	  end
    get '/ordered' => 'orders#ordered', as: :ordered
    get '/paid' => 'orders#paid', as: :paid
    get '/completed' => 'orders#completed', as: :completed
    get '/cancelled' => 'orders#cancelled', as: :cancelled
  end

  get '/admin', to: redirect('admin/orders#index')

end
