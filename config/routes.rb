
Rails.application.routes.draw do

  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'
  get "about", to: "home#about"
  get "sign_up", to:"registration#new"
  post "sign_up", to: "registration#create"
  delete "logout", to: "sessions#destroy"

  get "sign_in", to:"sessions#new"
  post "sign_in", to: "sessions#create"

  get "contact", to: "contact_form#new"
  resources :contact_form, only: %i[new create]

  resource :session
  resource :password
  resource :registration
  resource :password_reset



  # resources :tweets, except: [:edit, :update]
end
