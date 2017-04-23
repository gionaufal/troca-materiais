Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users, only: [:show]
  resources :materials, only: [:create, :new, :show, :index]
  resources :wishes, only: [:create, :new, :show, :index]
end
