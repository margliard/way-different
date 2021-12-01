class TravelboardsController < ApplicationController
  # before_action :set_travelboard
  skip_before_action :authenticate_user!, only: [:index, :show]
  # before_action :set_experience, only: :show

  def index
    @travelboard = Travelboard.new
    @travelboards = Travelboard.where(user_id: current_user)
    @experience = Experience.new
    @favorite = Favorite.new
    policy_scope(Travelboard)
  end

  def show
    @travelboard = Travelboard.find(params[:id])
    @travelboards = Travelboard.where(user_id: current_user)
    @travelboards_similar = Travelboard.where(country: @travelboard.country)
    @experience = Experience.new
    @reviewtrav = ReviewTravelboard.new
    @review_exp = ReviewExperience.new
    @experiences = @travelboard.experiences
    @favorite = Favorite.new
    authorize @travelboard
    # @favorite = Favorite.find(params[:favorite_id])
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
        category: experience.category,
        info_window: render_to_string(partial: "experiences/info_window", locals: { experience: experience }),
        image_url: image_url
      }
    end
    @chatroom = @travelboard.chatrooms.first
    @message = Message.new
  end

  def new
    @travelboard = Travelboard.new
    @favorite = Favorite.new
    @chatroom = Chatroom.new
    @user = current_user # devise
    @travelboards = Travelboard.where(user_id: @user)
    # @favorites = Favorite.where(user_id: @user)
    authorize @travelboard
  end

  def create
    @user = current_user
    @travelboard = Travelboard.new(travelboard_params)
    @travelboard.user = @user
    @travelday1 = Travelday.create(travelboard: @travelboard, day_number: 1)
    @travelday2 = Travelday.create(travelboard: @travelboard, day_number: 2)
    @travelday3 = Travelday.create(travelboard: @travelboard, day_number: 3)
    @travelday4 = Travelday.create(travelboard: @travelboard, day_number: 4)
    authorize @travelboard
    if @travelboard.save
      if params[:experience_id]
        @chatroom = Chatroom.new
        @chatroom.travelboard = @travelboard
        @chatroom.save
        @experience = Experience.find(params[:experience_id])
        @travelday = Travelday.create(travelboard: @travelboard, day_number: 0)
        @favorite = Favorite.create(experience: @experience, travelday: @travelday)
        redirect_to experience_path(@experience)
      else
        redirect_to travelboard_path(@travelboard)
      end
    else
      render :new
    end
  end

  def edit
  end

  def udpate
  end

  def destroy
  end

  private

  # def set_travelboard
  #   @travelboard = Travelboard.find(params[:id])
  #   authorize @travelboard
  # end

  def travelboard_params
    params.require(:travelboard).permit(:name, :user_id, :start_date, :end_date, :status, :country)
  end

  def favorite_params
    params.require(:favorite).permit(:experience_id)
  end

  def travelday_params
    params.require(:travelday).permit(:favorite_id, :travelboard_id)
  end
end
