Rails.application.routes.draw do
  root "page#dashboard"
  get "/countries", to: "page#countries"
  get "/countries/:search", to: "page#countries"

  scope module: "employees", path: "employees", as: "employee" do
    resources :contracts, only: [ :show, :edit, :update, :destroy ]
    resources :advances, only: [ :show, :edit, :update, :destroy ]
    resources :banks, only: [ :show, :edit, :update, :destroy ]
    resources :positions
  end

  resources :employees do
    scope module: :employees do
      resources :contracts, only: [ :index, :new, :create ]
      resources :advances, only: [ :index, :new, :create ]
      resources :banks, only: [ :index, :new, :create ]
    end
  end





  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
