class PlacesController < ApplicationController
  def index
    @places = Place.all

    # Apply filters based on request parameters
    apply_filters

    # Markers for the map
    if @places.present? && @places.any?(&:geocoded?)
      @markers = @places.geocoded.map do |place|
        {
          lat: place.latitude,
          lng: place.longitude
        }
      end
    else
      @markers = [] # Handle case where no places have coordinates
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
end
