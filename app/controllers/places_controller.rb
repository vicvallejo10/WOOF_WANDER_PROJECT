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

  def index
    @places = Place.all
    if params[:query].present?
      @places = @places.where("place_name ILIKE ?", "%#{params[:query]}%")
    end

    # Markers for the map
    @markers = @places.geocoded.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
      }
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def place_params
    params.require(:place).permit(:place_name,
                                  :place_description,
                                  :place_type,
                                  :address,
                                  :city,
                                  :country,
                                  :zip_code,
                                  :longitude,
                                  :latitude,
                                  :tag_offleash,
                                  :tag_wateraccess,
                                  :tag_outdoor,
                                  :tag_indoor,
                                  :tag_smallpet,
                                  :tag_mediumpet,
                                  :tag_largepet,
                                  :tag_disposalstation)
  end
end
