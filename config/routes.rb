Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :hosts, only: [:index, :create, :show, :update, :destroy]
  resources :stays, only: [:index, :create, :show, :update, :destroy]
  resources :guests, only: [:index, :create, :show, :update, :destroy]
  resources :users, only: [:index, :create, :show, :update, :destroy]

  Rails.application.routes.draw do
    resources :stays, only: [:show, :create] do
      resources :hosts, only: [:show, :index]
    end

    resources :hosts, only: [:show, :index, :create] do
      resources :stays, only: [:show, :index, :create]
    end

    resources :guests, only: [:show, :index, :create] do
      resources :stays, only: [:show, :index]
    end
  end

end
