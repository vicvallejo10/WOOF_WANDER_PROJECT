Rails.application.routes.draw do
  # Route for displaying the index page of filter options
  get 'filter_options/index'

  # Route for user authentication provided by the Devise gem
  devise_for :users

  # Route for the root of the application, directing to the home action of the pages controller
  root to: "pages#home"

  # Route for displaying the explore page, handled by the explore action of the pages controller
  get '/explore', to: 'pages#explore'

  # Route for displaying account information, handled by the accountinformation action of the accounts controller
  get '/accountinformation', to: 'accounts#accountinformation'

  # Route for searching places, handled by the search action of the places controller, with an alias 'search'
  get '/places/search', to: 'places#search', as: 'search'

  # Route for revealing health status. Returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :pets, only: [:index, :show, :new, :create, :destroy]  # Example route for pets


  # Nested route for reviews within places, allowing only new and create actions
  # Nested resources for places and reviews
  resources :places do
    resources :reviews, only: [:new, :create]
  end

  # Additional route for user accounts
  # Route for displaying account information for a specific user
  resources :users, only: [] do
    member do
      get 'accounts', to: 'accounts#accountinformation', as: 'accounts'
    end
  end

  # Additional route for showing pets within an account
  resources :accounts do
    member do
      get 'pets', to: 'accounts#accountinformation', as: 'account_pets'
    end
  end
end
