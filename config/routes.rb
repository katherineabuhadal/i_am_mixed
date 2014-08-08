Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resource :profile, only: [:show, :edit, :update]
    resources :messages, only: [:index, :create, :show]
  end

  resources :tags, only: [:show]
  resource :search, only: [:show]
  resources :stories do
    resource :like, only: [:create, :destroy]
    resources :responses, only: [:create]
  end

  resources :forums, only: [:index, :new, :create, :show, :edit] do 
    resources :topics, only: [:new, :index, :create, :show, :edit] do
      resources :posts, only: [:new, :edit, :create]
    end
  end

  get "/sign-up", to: "users#new", as: :sign_up
  get "/sign-out", to: "sessions#destroy", as: :sign_out
  get "/sign-in", to: "sessions#new", as: :sign_in

  root to: "stories#index"
end
