class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @place = Place.first
    @pets = Pet.all # Assuming Pet is your model representing pets
  end
end
