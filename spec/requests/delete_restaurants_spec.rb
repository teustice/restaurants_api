require 'rails_helper'

describe "delete endpoint", :type => :request do
  let!(:restaurants) { FactoryGirl.create_list(:restaurant, 1)}

  before do
    restaurant = Restaurant.all.last
    delete "/restaurants/#{restaurant.id}"
  end

  it 'deletes a restaurant' do
    expect(JSON.parse(response.body)['data']['attributes']['message']).to eq('The restaurant was deleted')
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
