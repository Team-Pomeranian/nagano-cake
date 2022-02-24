Rails.application.routes.draw do



  get 'searches/search'
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }

  get "search" => "searches#search"

  namespace :admin do
    root 'homes#top'

    resources :genres, only: [:index, :edit, :create, :update]

    resources :items, except: [:destroy]

    resources :orders, only: [:show, :update]do
      resources :order_items, only:[:update]
    end



    resources :customers, only: [:index, :show, :edit, :update]

  end


  scope module: :public do

  root 'homes#top'
  get '/about' => 'homes#about'

  resources :delivery_addresses,only: [:index, :edit, :create, :update, :destroy]

  resources :orders,only: [:new, :index, :show, :create] do
    collection do
      post 'confirm', to: 'orders#confirm'
      get 'complete', to: 'orders#complete'
    end
  end

  resources :cart_items,only: [:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all', to: 'cart_items#destroy_all'
    end
  end

  resource :customers,only: [:show, :edit, :update] do
    collection do
      get 'unsubscribe', to: 'customers#unsubscribe'
      patch 'withdraw', to: 'customers#withdraw'
    end
  end

  resources :items,only: [:index, :show]

  resources :genres, only: [:show]

  end


end
