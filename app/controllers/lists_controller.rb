class ListsController < ApplicationController
  before_action :set_account

  def index
    @places = @account.places
  end

  def destroy
    place = @account.places.find(params[:id])
    place.destroy
    redirect_to account_places_path(@account), notice: 'Favorite place removed successfully.'
  end

  def show
    @list = List.find(params[:id])
    authorize @list
  end

  private

  def set_account
    @account = current_user.account
  end
end
