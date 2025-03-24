Rails.application.routes.draw do
  get "/ping", to: "ping#pong"

  post "register", to: "auth#register"
  post "login", to: "auth#login"

  resources :users, only: [ :index, :show, :create, :update, :destroy ]
  resources :movies, only: [ :index, :show, :create, :update, :destroy ]
  resources :reviews, only: [ :index, :show, :create, :update, :destroy ]
end
