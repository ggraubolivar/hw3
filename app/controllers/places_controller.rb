class PlacesController < ApplicationController
  
  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def show
    @place = Place.find_by({ "name" => params["name"] })
    
  end

  def create
    # assign user-entered form data to Place's columns
    @place = Place.new
    @place["name"] = params["name"]
    # save Place row
    @place.save

    # redirect user
    redirect_to "/places"
  end
  
  def destroy
    @place = Place.find_by({ "name" => params["name"] })
    @place.destroy
    redirect_to "/companies"
  end

end
