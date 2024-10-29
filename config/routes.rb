Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :posts do
    resources :comments, only: [:create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  resources :profiles, only: [:show, :edit, :update]
  get "profile", to: "profiles#show", as: :user_profile

  # Custom GET route for logout
  devise_scope :user do
    get "logout", to: "users/sessions#destroy", as: :get_logout
  end

  root to: "posts#index"
end
