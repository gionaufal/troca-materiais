Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users, only: [:show]
  resources :materials
  resources :wishes
  resource :matches, only: [:new, :create]
end
