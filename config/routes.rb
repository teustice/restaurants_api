Rails.application.routes.draw do
  resources :restaurants
  get '/random_restaurant', to: "restaurants#random"
end
