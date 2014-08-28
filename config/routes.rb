Rails.application.routes.draw do

  root to: 'categories#index'

  get '/login',  to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :categories, only: [:index]
  resources :items, only: [:show]
  resources :users, only: [:new, :create]
  resource :account, only: [:show, :edit, :update]
  resource :cart, only: [:show, :update, :destroy]

  resources :orders, only: [:index, :new, :create, :show] do
    get '/cancel' => 'orders#cancel', as: :cancel
  end

  namespace :admin do
    get '/' => 'orders#index'

    resources :items do
      get '/delete_category/:category_id' => 'items#delete_category', as: :delete_category
      get '/add_category/:category_id' => 'items#add_category', as: :add_category
      get '/retire' => 'items#retire', as: :retire
    end

    resources :categories, except: [:show]
    resources :order_items, only: [:destroy, :update]
  	resources :orders, except: [:new, :destroy] do
	    get '/update_status' => 'orders#update_status', as: :update_status
	    get '/cancel' => 'orders#cancel', as: :cancel
	    get '/remove_item/:item_id' => 'orders#remove_item', as: :remove_item
	  end

    get '/ordered' => 'orders#ordered', as: :ordered
    get '/paid' => 'orders#paid', as: :paid
    get '/completed' => 'orders#completed', as: :completed
    get '/cancelled' => 'orders#cancelled', as: :cancelled
  end

  get '/code', to: redirect('https://github.com/MarcGarreau/grubhub_v2')
end
