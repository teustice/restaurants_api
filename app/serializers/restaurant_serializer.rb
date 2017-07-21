require 'jsonapi-serializers'

class RestaurantSerializer
  include JSONAPI::Serializer
  attribute :id
  attribute :name
  attribute :category
  attribute :price_range
  attribute :address
end
