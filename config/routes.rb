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

  # added by Olivier on Saturday
  put '/users/update', to: 'accounts#update_avatar', as: 'update_avatar'

  # Route for searching places, handled by the search action of the places controller, with an alias 'search'
  # get '/places/search', to: 'places#search', as: 'search'

  # Route for navigation instructions to a place, handled by the navigate action of the places controller, with an alias 'navigate'
  get '/places/:id/navigate', to: 'places#navigate', as: 'navigate'
  post 'places/updatelist', to: 'places#updatelist', as: 'update_list'
  get '/lists', to: 'lists#index'

  # added by Olivier on Saturday
  resources :lists, only: [:index, :destroy]

  # Route for revealing health status. Returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :pets, only: [:index, :show, :new, :create, :destroy, :edit]
  patch '/pets/:id', to: 'pets#update', as: 'update_pet'
  # get '/pets/:id', to: 'pets#show', as: 'specific_pet'
  # get '/pets/:id/edit', to: 'pets#edit', as: 'edit_specific_pet'

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
      delete "pets/:id", to: "pets#destroy"
    end
  end
end
