Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  root to: "stories#index"
  get "/sign-up", to: "users#new", as: :sign_up
  get "/sign-out", to: "sessions#destroy", as: :sign_out
  get "/sign-in", to: "sessions#new", as: :sign_in
end
