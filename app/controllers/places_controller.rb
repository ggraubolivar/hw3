class PlacesController < ApplicationController
  
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @posts = Post.where({ "place_id" => @place["id"] })
  end

  def create
    # assign user-entered form data to Place's columns
    @place = Place.new
    @place["name"] = params["place"]["name"]
    # save Place row
    @place.save

    # redirect user
    redirect_to "/places"
  end
  
  def destroy
    @place = Place.find_by({ "id" => params["id"] })
    @place.destroy
    redirect_to "/places"
  end

end
