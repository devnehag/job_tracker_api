Rails.application.routes.draw do
    # Users
  resources :users, only: [:create, :index, :show] do
    # Additional user-specific routes if needed
  end
  # Jobs
  resources :jobs do
    resources :checklists, only: [:show] do
      resources :checklist_items, only: [:index, :create, :update, :destroy]
    end
  end
  # Checklists
  resources :checklists, only: [:create, :update, :destroy] do
    resources :checklist_items, only: [:index, :create, :update, :destroy]
  end
  # Checklist Items
  resources :checklist_items, only: [:index, :create, :update, :destroy]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
   # Root route
   root 'home#index'
   post '/login', to: 'sessions#create'
end
