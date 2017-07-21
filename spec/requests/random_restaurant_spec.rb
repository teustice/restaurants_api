require 'rails_helper'

describe "get random restaurants endpoint", :type => :request do
  let!(:restaurants) { FactoryGirl.create_list(:restaurant, 100)}

  it 'returns a random restaurant' do
    get '/random_restaurant'
    rand1 = JSON.parse(response.body)["data"]["attributes"]["name"]
    get '/random_restaurant'
    rand2 = JSON.parse(response.body)["data"]["attributes"]["name"]
    expect(rand1).should_not eq rand2
  end

  it 'returns status code 200' do
    get '/restaurants'
    expect(response).to have_http_status(:success)
  end
end
