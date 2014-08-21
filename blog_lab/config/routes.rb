Rails.application.routes.draw do
  get "/", to: "posts#index"

  get "/new", to: "posts#new"

  get "/index", to: "posts#index"

  get "/show/:id", to: 'posts#update'

  post "/create", to: 'posts#create' 
end
