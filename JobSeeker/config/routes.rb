Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resource :users do
    resource :profiles
  end

  resources :categories
  resources :classfields, only: [:show, :new, :edit, :update]  do
    resources :user_classfields, only: [:create, :index, :update]
  end

  get "my-classfields", to: "classfields#index", as: "my_classfields"
  get "my-applications", to: "user_classfields#user_applications", as: "my_applications"


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root to: "profiles#show", as: :authenticated_root
  end
  # Defines the root path route ("/")
  root to: redirect("/users/sign_in")
end
