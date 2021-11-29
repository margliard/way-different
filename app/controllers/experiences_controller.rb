class ExperiencesController < ApplicationController
  before_action :set_experience, only: :show

  def index

    # @experiences = policy_scope(Experience)

    # Experience.where(category: params[:filter])

    if params[:query].present?
      @experiences = Experience.search_by_city_and_country(params[:query])
    else
      @experiences = Experience.all
    end

    if params[:query].present?
      @travelboards = Travelboard.search_by_city_and_country(params[:query])
    else
      @travelboards = Travelboard.all
    end
    @markers = @experiences.geocoded.map do |experience|
      if experience.category == "Accommodation"
        image_url = helpers.asset_url("houseone.png")
      elsif experience.category == "Activity"
        image_url = helpers.asset_url("backpack.png")
      else
        image_url = helpers.asset_url("housetwo.png")
      end
      {
        lat: experience.latitude,
        lng: experience.longitude,
        info_window: render_to_string(partial: "info_window", locals: { experience: experience }),
        image_url: image_url
      }
    end
  end

  def show
    @favorite = Favorite.new
    @review = ReviewExperience.new
    @travelboards = Travelboard.where(user_id: current_user)
    @travelboard = Travelboard.new
    @nearby_experiences = Experience.near(@experience.to_coordinates, 200)
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
  end

  private

  def set_experience
    @experience = Experience.find(params[:id])
    # authorize @experience
  end
end
