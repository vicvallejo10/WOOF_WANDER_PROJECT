# app/helpers/application_helper.rb

module ApplicationHelper
  def random_recommendations(number_of_recommendations)
    recommendations = Place.all.sample(number_of_recommendations)
    recommendations.shuffle
  end
end
