Rails.application.routes.draw do
  resources :restaurants
  get '/random_restaurant', to: "restaurants#random"
  get '/search_restaurant', to: "restaurants#search"
end
