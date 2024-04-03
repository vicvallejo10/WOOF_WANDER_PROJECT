Rails.application.routes.draw do
  get 'filter_options/index'
  devise_for :users
  root to: "pages#home"
  get '/explore', to: 'pages#explore'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define nested resources for places and reviews
  resources :places do
    resources :reviews, only: [:new, :create]
  end

  # Route for the filter options page
  get '/filter_options', to: 'filter_options#index', as: 'filter_options'
end
