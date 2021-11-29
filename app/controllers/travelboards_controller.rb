class TravelboardsController < ApplicationController
  # before_action :set_travelboard
  skip_before_action :authenticate_user!, only: [:index, :show]
  # before_action :set_experience, only: :show


  def index
    @travelboard = Travelboard.new
    @travelboards = Travelboard.all
    @experience = Experience.new
    @favorite = Favorite.new
    policy_scope(Travelboard)
  end

  def show
    @travelboard = Travelboard.find(params[:id])
    @travelboards = Travelboard.where(user_id: current_user)
    @experience = Experience.new
    @reviewtrav = ReviewTravelboard.new
    @review_exp = ReviewExperience.new
    @favorite = Favorite.new
    authorize @travelboard
    # @favorite = Favorite.find(params[:favorite_id])
    # @travelboards = policy_scope(Experience)
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @travelboard = Travelboard.new
    @favorite = Favorite.new
    @user = current_user # devise
    @travelboards = Travelboard.where(user_id: @user)
    # @favorites = Favorite.where(user_id: @user)
    authorize @travelboard
  end

  def create
    @user = current_user
    @travelboard = Travelboard.new(travelboard_params)
    @travelboard.user = @user
    if @travelboard.save
      if params[:experience_id]
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
