require 'rails_helper'

describe "create endpoint", :type => :request do

  before do
    post '/restaurants', params: {name: "test_name", category: "test_category", price_range: 15, address: "test_address"}
  end

  it 'returns the restaurant name' do
    expect(JSON.parse(response.body)['data']['attributes']['name']).to eq('test_name')
  end
  it 'returns the restaurant category' do
    expect(JSON.parse(response.body)['data']['attributes']['category']).to eq('test_category')
  end
  it 'returns the restaurant price_range' do
    expect(JSON.parse(response.body)['data']['attributes']['price-range']).to eq(15)
  end
  it 'returns the restaurant address' do
    expect(JSON.parse(response.body)['data']['attributes']['address']).to eq('test_address')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end
