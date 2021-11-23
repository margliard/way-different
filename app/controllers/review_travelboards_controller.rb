class ReviewTravelboardsController < ApplicationController
  def new
    @travelboard = Travelboard.find(params[:travelboard_id])
    @review = ReviewTravelboard.new
  end

  def create
    @review = ReviewTravelboard.new(review_params)
    @travelboard = Travelboard.find(params[:travelboard_id])
    @review.experience = @travelboard
    if @travelboard.save
    redirect_to travelboard_path(@travelboard)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
