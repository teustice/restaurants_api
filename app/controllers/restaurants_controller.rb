class RestaurantsController < ApplicationController
  include Response
  def index
    # potential search logic MAKE IT A SCOPE
    # if params[:artist]
    #   artist = params[:artist]
    #   @songs = Song.search(artist)
    # else
    # end
    @restaurants = Restaurant.all
    json_response(@restaurants, 200)
    # json_response(JSONAPI::Serializer.serialize(@songs , is_collection: true))
  end

end
