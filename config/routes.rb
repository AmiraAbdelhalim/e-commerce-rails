Rails.application.routes.draw do
  resources :products
  resources :categories
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'search',to:'home#search'
  # authenticated :user do
  #   # get 'home/index'
  #   root to: 'home#index', as: :authenticated_root
  #   # resources :users
  # end
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
