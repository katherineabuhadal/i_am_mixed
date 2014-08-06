Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :profile, only: [:show, :edit, :update]
  resources :tags, only: [:show]
  resources :stories do 
    resource :like, only: [:create, :destroy]
    resources :responses, only: [:create]
  end

  get "/sign-up", to: "users#new", as: :sign_up
  get "/sign-out", to: "sessions#destroy", as: :sign_out
  get "/sign-in", to: "sessions#new", as: :sign_in

  root to: "stories#index"
end
