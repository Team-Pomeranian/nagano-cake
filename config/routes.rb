Rails.application.routes.draw do

  devise_for :customers, skip: :all
  devise_scope :customer do
    get 'customers/sign_in' => 'public/sessions#new', as: 'new_customer_session'
    post 'customers/sign_in' => 'public/sessions#create', as: 'customer_session'
    delete 'customers/sign_out' => 'public/sessions#destroy', as: 'destroy_customer_session'
    get 'customers/sign_up' => 'public/registrations#new', as: 'new_customer_registration'
    post 'customers' => 'public/registrations#creat', as: 'customer_registration'
  end

  devise_for :admin,skip: [:registrations, :passwords], controllers:{
    sessions: "admin/sessions"
  }

  namespace :admin do
    root 'homes#top'

    resources :genres, only: [:index, :edit, :create, :update]

    resources :items, except: [:destroy]

    resources :orders, only: [:show, :update]

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

  end


end
