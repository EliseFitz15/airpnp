Rails.application.routes.draw do
  root 'bathrooms#index'
  resources :bathrooms, only: [:index, :new, :create, :show]
end
