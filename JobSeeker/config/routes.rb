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
  resources :classfields, only: [:show, :new, :edit, :update, :index, :create]  do
    resources :applications, only: [:create, :index, :update] do
      resources :reviews, only: [:new, :create, :index] do
        collection do
          get :new_applicant_review
          post :create_applicant_review
        end
      end
    end
  end

  get "user/classfields", to: "users#index", as: "user_classfields"
  get "user/applications", to: "applications#user_applications", as: "user_applications"


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :user do
    root to: "profiles#show", as: :authenticated_root
  end
  # Defines the root path route ("/")
  root to: redirect("/categories")
end
