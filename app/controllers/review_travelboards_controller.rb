class ReviewTravelboardsController < ApplicationController
  def new
    @travelboard = Travelboard.find(params[:travelboard_id])
    @review = ReviewTravelboard.new
  end

  def create
    @review = ReviewTravelboard.new(review_params)
    @travelboard = Travelboard.find(params[:travelboard_id])
    @review.travelboard = @travelboard
    @review.user = current_user
    @review.save!
    redirect_to travelboard_path(@travelboard)
  end

  def destroy
    @review = ReviewTravelboard.find(params[:id])
    @review.destroy
    redirect_to travelboard_path(@review.travelboard)
  end

  private

  def review_params
    params.require(:review_travelboard).permit(:comment, :rating)
  end
end
