class RestaurantsController < ApplicationController
  include Response
  include ErrorSerializer

  def index
    @restaurants = Restaurant.all.page params[:page]
    json_response(JSONAPI::Serializer.serialize(@restaurants , is_collection: true), 200)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    json_response(JSONAPI::Serializer.serialize(@restaurant), 200)
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      json_response(JSONAPI::Serializer.serialize(@restaurant), :created)
    else
      render json: ErrorSerializer.serialize(@restaurant.errors)
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update!(restaurant_params)
      json_response({"data":{"type": "messages","attributes": {"message": "The restaurant was updated successfully"}}}, 200)
    else
      render json: ErrorSerializer.serialize(@restaurant.errors)
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.destroy!
      json_response({"data":{"type": "messages","attributes":{"message": "The restaurant was deleted"}}}, 200)
    else
      render json: ErrorSerializer.serialize(@restaurant.errors)
    end
  end

  def random
    @restaurant = Restaurant.all.sample
    json_response(JSONAPI::Serializer.serialize(@restaurant), 200)
  end

  def search
      results = Restaurant.search(params)
      if results
        json_response(JSONAPI::Serializer.serialize(results, is_collection: true), 200)
      else
        json_response({"data":{"type": "errors","attributes": {"error": "You can't pass multiple parameters into a search."}}}, 409)
      end
  end

  private
  def restaurant_params
    params.permit(:id, :name, :category, :price_range, :address)
  end
end
