class ReviewExperiencesController < ApplicationController
  def new
    @review = ReviewExperience.new
    @experience = Experience.find(params[:experience_id])
  end

  def create
    @review = ReviewExperience.new(review_params)
    @favorite = Favorite.new
    @experience = Experience.find(params[:experience_id])
    @review.experience = @experience
    @travelboards = Travelboard.where(user_id: current_user)
    @travelboard = Travelboard.new
    @review.user = current_user
    if @review.save
      redirect_to experience_path(@experience)
    else
      render "experiences/show"
    end
  end

  def destroy
    @review = ReviewExperience.find(params[:id])
    @review.destroy
    redirect_to experience_path(@review.experience)
  end

  private

  def review_params
    params.require(:review_experience).permit(:comment, :rating)
  end
end
