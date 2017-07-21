require 'rails_helper'

describe "get all restaurants endpoint", :type => :request do
  let!(:restaurats) { FactoryGirl.create_list(:restaurant, 20)}

  it 'returns all restaurants' do
    get '/restaurants'
    expect(JSON.parse(response.body)["data"].size).to eq(20)
  end

  it 'returns a single restaurant' do
    restaurant = Restaurant.all.first
    get "/restaurants/#{restaurant.id}"
    expect(JSON.parse(response.body)["data"]["attributes"]["name"]).to eq(restaurant.name)
  end

  it 'returns status code 200' do
    get '/restaurants'
    expect(response).to have_http_status(:success)
  end
end
