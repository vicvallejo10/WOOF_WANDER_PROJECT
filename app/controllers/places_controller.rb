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

  def show
    @place = Place.find(params[:id])
    @review = Review.new # Initialize a new review object for the form
    @total_reviews_count = @place.reviews.count
    # @reviews = @place.reviews.order(created_at: :description :title)
  end

  def search
    # Fetch parameters from params hash
    size = params[:size]
    # Call the filter method to get filtered places
    @filtered_places = Place.filter(size) # You can pass more parameters as needed
    # Render the search view
    render 'search'
  end

  def index
    @places = Place.all

    # Apply filters based on request parameters
    apply_filters

    # Markers for the map
    if @places.present? && @places.any?(&:geocoded?)
      @markers = @places.geocoded.map do |place|
        {
          lat: place.latitude,
          lng: place.longitude,
          info_window_html: render_to_string(partial: "info_window", locals: {place: place})
        }
      end
    else
      @markers = [] # Handle case where no places have coordinates
    end
  end

  # Method to pass the destination coordinates to the stimulus controller -> navigation_map
  def navigate
    @place = Place.find(params[:id])
    @markers = [@place.longitude, @place.latitude]
    puts @markers
  end

  # method to update the list. The info comes from the stimulus controller 'heart'
  def updatelist
    # first we get the param from the JSON
    @place = Place.find(params[:place_id])

    # we check if the place is already in the favorite
    @list = List.find_by(user_id: current_user.id, place_id: @place.id)
    puts "test list:"
    puts @list
    if @list.nil?
      # there is no place_id in the user's list, so we create it
      @list = List.new(user_id: current_user.id, place_id: @place.id)
      @list.save
    else
      # otherwise, we delete the existing place (because the user unclick the heart)
      @list.destroy
    end
  end

  private

  def apply_filters
    # Filter by query if present
    @places = @places.where("place_name ILIKE ?", "%#{params[:query]}%") if params[:query].present?

    # Filter by size if present
    case params[:size]
    when 'Small'
      @places = @places.where(tag_smallpet: true)
    when 'Medium'
      @places = @places.where(tag_mediumpet: true)
    when 'Large'
      @places = @places.where(tag_largepet: true)
    end

    # Filter by special characteristics if present
    @places = filter_by_special_characteristics(@places) if params[:special_characteristic].present?

    # Filter by place type if present
    @places = @places.where(place_type: params[:place_type]) if params[:place_type].present?
  end

  def filter_by_special_characteristics(places)
    special_characteristics = params[:special_characteristic]
    return places unless special_characteristics.present?

    places = places.where(tag_disposalstation: true) if special_characteristics.include?('Disposal Station')
    places = places.where(tag_offleash: true) if special_characteristics.include?('Offleash')
    places = places.where(tag_wateraccess: true) if special_characteristics.include?('Water Access')
    places = places.where(tag_outdoor: true) if special_characteristics.include?('Outdoor')
    places = places.where(tag_indoor: true) if special_characteristics.include?('Indoor')

    places
  end

  # I didn't modify the method and created a new one below this one
  def save_to_list
    place = Place.find(params[:place_id])
    list = current_user.lists.find(params[:list_id])
    list.places << place

    redirect_to place_path(place), notice: "Place saved to list successfully!"
  end
end
