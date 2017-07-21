require 'rails_helper'

describe "update a restaurant endpoint", :type => :request do
  let!(:restaurants) { FactoryGirl.create_list(:restaurant, 1)}

  before do
    restaurant = Restaurant.all.last
    put "/restaurants/#{restaurant.id}", params: {name: "test_name", category: "test_category", price_range: "test_price_range", address: "test_address"}
  end

  it 'updates a restaurant' do
    expect(JSON.parse(response.body)['data']['attributes']['message']).to eq('The restaurant was updated successfully')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
