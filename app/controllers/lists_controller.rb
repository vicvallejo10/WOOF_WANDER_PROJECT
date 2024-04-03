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

  private

  def set_account
    @account = current_user.account
  end
end
