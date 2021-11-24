class ExperiencesController < ApplicationController
  before_action :set_experience, only: :show

  def index
    @experiences = Experience.all
    # @experiences = policy_scope(Experience)
  end

  def show
    @user = current_user
    @favorite = Favorite.new
    @review = ReviewExperience.new
    @travelboards = @user.travelboards
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
    # authorize @experience
  end
end
