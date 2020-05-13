Rails.application.routes.draw do
  resources :products do
    collection do
      get :filter
    end
    end 
  resources :line_items
  resources :carts
  resources :products
  resources :orders
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'search',to:'home#search'
  # get 'filter',to:'products#filter'
  # authenticated :user do
  #   # get 'home/index'
  #   root to: 'home#index', as: :authenticated_root
  #   # resources :users
  # end
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
