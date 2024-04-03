class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  # def index
  def home
    # @owner_name = current_user.name if current_user # Assuming you have a 'name' attribute in your User model
  end

  # Explore page to see all places and search
  def explore
    @places = Place.all
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end

end
