class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # def home
  #   @place = Place.first
  #   @pets = Pet.all # Assuming Pet is your model representing pets
  # end

  def home
    if user_signed_in?
      render 'home_logged_in'
      @place = Place.first
      @pets = Pet.all # Assuming Pet is your model representing pets
    else
      @place = Place.first
      @pets = Pet.all
      render 'home'
    end
  end
end
