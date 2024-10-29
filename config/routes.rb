Rails.application.routes.draw do
  devise_for :users
  resources :posts do
    resources :comments, only: [:create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root to: "posts#index"
end
