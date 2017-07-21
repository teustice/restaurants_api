class RestaurantsController < ApplicationController
  include Response
  def index
    # potential search logic MAKE IT A SCOPE
    # if params[:artist]
    #   artist = params[:artist]
    #   @restaurants = Restaurant.search(artist)
    # else
    # end
    @restaurants = Restaurant.all
    json_response(@restaurants, 200)
    # json_response(JSONAPI::Serializer.serialize(@restaurants , is_collection: true))
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    json_response(@restaurant, 200)
    # json_response(JSONAPI::Serializer.serialize(@restaurant, include: ['reviews']))
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      json_response(@restaurant, :created)
    else
      json_response({message: "There was a error adding your restaurant", errors: @restaurant.errors}, 409)
    end
    # json_response(JSONAPI::Serializer.serialize(@restaurant), :created)
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update!(restaurant_params)
      json_response({message: "The restaurant '#{@restaurant.name}' was successfully updated"}, 200)
    else
      json_response({message: "There was a error updating your restaurant", errors: @restaurant.errors}, 409)
    end
      # json_response({"data":{"type":"messages","attributes":{"message":"The restaurant was updated"}}})
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.destroy!
      json_response({message: "The restaurant '#{@restaurant.name}' was successfully deleted"}, 200)
    else
      json_response({message: "There was a error deleting your restaurant", errors: @restaurant.errors}, 409)
    end
      # json_response({"data":{"type":"messages","attributes":{"message":"The restaurant was deleted"}}})
  end

  private
  def restaurant_params
    params.permit(:id, :name, :category, :price_range, :address)
  end
  # def restaurant_params
  #   params.require(:data).permit(:type, {
  #    attributes: [:id, :name, :category, :price_range, :address]
  #  })
  # end

  # def restaurant_attributes
  #   restaurant_params[:attributes] || {}
  # end
end
