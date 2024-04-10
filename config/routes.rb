Rails.application.routes.draw do
  get 'filter_options/index'
  devise_for :users
  root to: "pages#home" # Define your root route once
  get '/explore', to: 'pages#explore'
  get '/accountinformation', to: 'accounts#accountinformation'
  get '/places/search', to: 'places#search', as: 'search'


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :pets, only: [:index, :show, :new, :create]  # Example route for pets

  # Defines the root path route ("/")
  # root "posts#index"
  resources :places do
    resources :reviews, only: [:new, :create]
  end

  # This is Feiyue's Code
  resources :users, only: [] do
    member do
      get 'accounts', to: 'accounts#accountinformation', as: 'accounts'
    end
  end

  # show pets in accountinformation
  resources :accounts do
    member do
      get 'pets', to: 'accounts#accountinformation', as: 'account_pets'
    end
  end

  #get '/places/search', to: 'places#search', as: 'search'

  # This is the original Code
  #root 'accounts#show'
  #resources :users, only: [:show, :edit, :update] do
    #resources :pets, except: [:index, :show]
    #resources :place, only: [:index, :destroy]
  #end

end
