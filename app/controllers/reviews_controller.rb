class ReviewsController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @review = @place.reviews.new
  end

  def create
    @place = Place.find(params[:place_id])
    @review = @place.reviews.new(review_params)
    @review.user = current_user # Assuming you have user authentication

    if @review.save
      redirect_to @place, notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
end
