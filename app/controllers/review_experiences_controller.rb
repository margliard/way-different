class ReviewExperiencesController < ApplicationController
  def new
    @review = ReviewExperience.new
    @experience = Experience.find(params[:experience_id])
  end

  def create
    @review = ReviewExperience.new(review_params)
    @experience = Experience.find(params[:experience_id])
    @review.experience = @experience
    @review.user = current_user
    @review.save!
    redirect_to experience_path(@experience)
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
