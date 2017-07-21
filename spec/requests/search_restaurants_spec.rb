require 'rails_helper'

describe "get search restaurants endpoint", :type => :request do
  let!(:restaurants) { FactoryGirl.create_list(:restaurant, 20)}

  it 'searches for a restaurant by name' do
    restaurant = Restaurant.all.last
    get "/search_restaurant?name=#{restaurant.name}"
    expect(JSON.parse(response.body)["data"][0]["attributes"]["name"]).to eq(restaurant.name)
  end

  it 'searches for a restaurant by category' do
    restaurant = Restaurant.all.last
    get "/search_restaurant?category=#{restaurant.category}"
    expect(JSON.parse(response.body)["data"][0]["attributes"]["category"]).to eq(restaurant.category)
  end

  it 'returns status code 200' do
    get '/restaurants'
    expect(response).to have_http_status(:success)
  end
end
