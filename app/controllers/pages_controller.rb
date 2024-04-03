class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  # def index
  def home
    # @owner_name = current_user.name if current_user # Assuming you have a 'name' attribute in your User model
  end

end
