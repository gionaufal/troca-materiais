Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :materials, only: [:create, :new, :show, :index]
  resources :wishes, only: [:create, :new, :show, :index]
end
