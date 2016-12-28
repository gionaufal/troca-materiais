Rails.application.routes.draw do
  root 'home#index'
  resources :materials, only: [:create, :new, :show]
end
