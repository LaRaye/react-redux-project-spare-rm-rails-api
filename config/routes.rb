Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/home', to: 'sessions#home'
  get '/', to: 'sessions#create' #home with login form
  post '/', to: 'sessions#create' #login
  get '/logout', to: 'sessions#destroy'
  get '/get_current_user', to: 'sessions#get_current_user'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'


  resources :users, only: [:index, :show, :update, :destroy]
  resources :hosts, only: [:index, :create, :show, :update, :destroy]
  resources :stays, only: [:index, :create, :show, :update, :destroy]
  resources :guests, only: [:index, :create, :show, :update, :destroy]
  resources :users, only: [:index, :show, :update, :destroy]

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
