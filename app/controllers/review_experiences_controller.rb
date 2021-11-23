class ReviewExperiencesController < ApplicationController
  def new
    @experience = Experience.find(params[:experience_id])
    @review = ReviewExperience.new
  end

  def create
    @review = ReviewExperience.new(review_params)
    @experience = Experience.find(params[:experience_id])
    @review.experience = @experience
    if @experience.save
    redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
