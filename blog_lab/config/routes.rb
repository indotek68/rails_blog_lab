Rails.application.routes.draw do
  root to: 'posts#index'
  resources :posts do
    resources :tags
    resources :comments
  end
  # get "/", to: "posts#index"

  # get "/new", to: "posts#new"

  # get "/index", to: "posts#index"

  # get "/show/:id", to: 'posts#show'

  # get "/tags", to: "tags#index"

  # get "tags/:id", to: "tags#show"

  # post "/create", to: 'posts#create' 

  # post "/update", to: 'posts#update'

  # post "/destroy", to: 'posts#destroy'
end
