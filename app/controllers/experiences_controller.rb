class ExperiencesController < ApplicationController
  before_action :set_experience, only: :show

  def index
    # @experiences = policy_scope(Experience)
    if params[:query].present?
      p @experiences = Experience.search_by_city_and_country(params[:query])
    else
      @experiences = Experience.all
    end
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
