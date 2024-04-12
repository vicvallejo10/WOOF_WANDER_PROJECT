# app/helpers/application_helper.rb

module ApplicationHelper
  def random_recommendation_of_the_day
    # Fetch all places from the database
    places = Place.all
    # Get a random place from the list of places
    random_place = places.sample
    # Return the random place
    random_place
  end
end
