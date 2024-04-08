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

    @places = @places.where(tag_smallpet: true) if params[:size]&.include?('Small')
    @places = @places.where(tag_mediumpet: true) if params[:size]&.include?('Medium')
    @places = @places.where(tag_largepet: true) if params[:size]&.include?('Big')
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
    @review = Review.new # Initialize a new review object for the form
    @total_reviews_count = @place.reviews.count
    # @reviews = @place.reviews.order(created_at: :description :title)
  end

  def search(params)
    #place_type = params[:place_type]
    size = params[:size]
    #special_characteristics = params[:special_characteristics]
    #ratings = params[:ratings]
   # proximity = params[:proximity]
    filtered_places = Place.filter(size) #ratings, proximity)
    # You can return filtered_places directly or process it further as needed
    render 'search'
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
