# app/controllers/lists_controller.rb
class ListsController < ApplicationController
  before_action :authenticate_user!

  # def index
  #   @lists = current_user.lists
  # end

  def index
    @saved_places = current_user.lists.map(&:place)
  end

  def create
    @list = current_user.lists.build(place_id: params[:place_id])

    if @list.save
      redirect_back fallback_location: root_path, notice: 'Place added to favorites successfully.'
    else
      redirect_back fallback_location: root_path, alert: 'Failed to add place to favorites.'
    end
  end

  def destroy
    @list = current_user.lists.find_by(place_id: params[:place_id])

    if @list
      @list.destroy
      redirect_back fallback_location: root_path, notice: 'Place removed from favorites successfully.'
    else
      redirect_back fallback_location: root_path, alert: 'Place not found in favorites.'
    end
  end
end
