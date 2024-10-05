Rails.application.routes.draw do

  root to: "intro#index"

  get "auth/login", to: "auth#login"
  get "auth/signup", to: "auth#signup"
  post "auth/login", to: "auth#create_session"
  post "auth/signup", to: "auth#create_user"
  delete "auth/logout", to: "auth#logout"

  get "dashboard", to: "dashboard#index"
  namespace :dashboard do
    resources :patients, only: [ :create, :update, :destroy, :edit ]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
