class PlacesController < ApplicationController
  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user = current_user

    if @place.save!
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
