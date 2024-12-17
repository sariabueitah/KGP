Rails.application.routes.draw do
  root "page#dashboard"
  post "/session_reset", to: "page#session_reset"
  # Routes for fetching and searching for countries
  get "/countries", to: "page#countries"
  get "/countries/:search", to: "page#countries"

  # Routes for pages that shows all contracts for all employees
  get "/employees/contracts", to: "employees/contracts#contracts_index"

  # Routes for contracts, and positions with the employees as prefix to avoid deep nesting in the future
  # eg. employees/contracts/:contract_id/edit
  scope module: "employees", path: "employees", as: "employee" do
    resources :contracts, only: [ :show, :edit, :update, :destroy ]
    resources :positions
  end

  # Routes for Employees CRUD with nested routes for associated models
  # eg. employees/:employee_id/contracts/new
  resources :employees do
    scope module: :employees do
      resources :contracts, only: [ :index, :new, :create ]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
