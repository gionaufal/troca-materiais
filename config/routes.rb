Rails.application.routes.draw do
  root 'home#index'
  resources :materials, only: [:create, :new, :show, :index]
  resources :wishes, only: [:create, :new, :show, :index]
end
