Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hosts, only: [:index, :create, :show, :update, :destroy]
  resources :stays, only: [:index, :create, :show, :update, :destroy]
  resources :guests, only: [:index, :create, :show, :update, :destroy]
end
