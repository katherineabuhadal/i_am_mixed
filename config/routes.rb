Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resource :profile, only: [:show, :edit, :update]
    resources :messages, only: [:index, :create, :show]
  end

  resource :email_confirmation, only: [:new, :create]

  resources :tags, only: [:show]
  resource :search, only: [:show]
  resources :stories do
    resource :like, only: [:create, :destroy]
    resources :responses, only: [:create]
    resources :story_spams, only: [:create]
  end

  resources :responses, only: [:destroy] do
    resources :responses, only: [:create]
  end

  resources :posts, only: [] do
    resources :post_spams, only: [:create]
  end

  resources :forums do
    resources :topics, only: [:new, :create, :destroy, :index, :show] do
      resources :posts, only: [:new, :edit, :create, :destroy, :update, :show]
      resources :topic_spams, only: [:create]
    end
  end

  resource :admin_dashboard, only: [:show]

  get "/sign-up", to: "users#new", as: :sign_up
  get "/sign-out", to: "sessions#destroy", as: :sign_out
  get "/sign-in", to: "sessions#new", as: :sign_in

  root to: "stories#index"
end
