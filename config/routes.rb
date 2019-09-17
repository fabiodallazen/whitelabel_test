# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'
  resources :home, only: [:index]
  resources :user_lists do
    collection do
      get 'choose_products/:id', to: 'user_lists#choose_products', as: 'choose_products'
      get 'save_product/:id', to: 'user_lists#save_product', as: 'save_product'
      get 'add_product/:id', to: 'user_lists#add_product', as: 'add_product'
      get 'remove_product/:id', to: 'user_lists#remove_product', as: 'remove_product'
    end
  end
end
