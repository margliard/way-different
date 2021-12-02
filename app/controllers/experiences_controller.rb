class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_experience, only: :show

  def index
    @experiences = policy_scope(Experience)
    @experience = Experience.new
    @experience_label=ExperienceLabel.new
    @label = Label.new
    # Experience.where(category: params[:filter])
    if params[:query].present?
      # @experiences = Experience.search_by_city_and_country(params[:query])
      @experiences = Experience.near(params[:query], 200)
    else
      @experiences = Experience.all
    end
    if params[:query].present?
      @travelboards = Travelboard.search_by_city_and_country(params[:query])
    else
      @travelboards = Travelboard.all
    end
    # Mapbox
    @markers = @experiences.geocoded.map do |experience|
      if experience.category == "Accommodation"
        image_url = helpers.asset_url("housethree.png")
      elsif experience.category == "Activity"
        image_url = helpers.asset_url("bicycle.png")
      else
        image_url = helpers.asset_url("cutlery(3).png")
      end
      {
        lat: experience.latitude,
        lng: experience.longitude,
        info_window: render_to_string(partial: "info_window", locals: { experience: experience }),
        image_url: image_url,
        experience_id: experience.id,
        experience_url: experiences_path(anchor: "experience-#{experience.id}")
      }
    end
  end

  def show
    @favorite = Favorite.new
    @review = ReviewExperience.new
    @travelboards = Travelboard.where(user_id: current_user)
    @experience_labels = ExperienceLabel.where(experience_id: params[:id])
    @travelboard = Travelboard.new
    @nearby_experiences = Experience.near(@experience.to_coordinates, 120)


      if @experience.category == "Accommodation"
        image_url = helpers.asset_url("housethree.png")
      elsif @experience.category == "Activity"
        image_url = helpers.asset_url("bicycle.png")
      else
        image_url = helpers.asset_url("cutlery(3).png")
      end
      @markers = [
      {
        lat: @experience.latitude,
        lng: @experience.longitude,
        info_window: render_to_string(partial: "info_window", locals: { experience: @experience }),
        image_url: image_url
      }
    ]
    authorize @experience

  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
    authorize @experience
  end
end
