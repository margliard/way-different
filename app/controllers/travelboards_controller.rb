class TravelboardsController < ApplicationController
  def index
    @travelboards = Travelboard.all
  end

  def show
    @travelboard = Travelboard.find(params[:id])
    @review = ReviewTravelboard.new
    # @favorite = Favorite.find(params[:favorite_id])
  end

  def new
    @travelboard = Travelboard.new
    #@favorite = Favorite.new
    @user = current_user # devise
    @travelboards = Travelboard.where(user_id: @user)
    # @favorites = Favorite.where(user_id: @user)
    # authorize @travelboard
  end

  def create
    @user = current_user
    @travelboard = Travelboard.new(travelboard_params)
    @travelboard.user = @user
    if params[:experience_id].exist?
      @favorite = Favorite.new(favorite_params)
      @favorite.save
      @travelday = Travelday.new(travelday_params)
      @travelday.day_number = 0
    else

    end
    if @travelboard.save
      redirect_to travelboard_path(@travelboard)
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

  def travelboard_params
    params.require(:travelboard).permit(:name, :user_id, :start_date, :end_date, :status)
  end

  def favorite_params
    params.require(:favorite).permit(:experience_id)
  end

  def travelday_params
    params.require(:travelday).permit(:favorite_id, :travelboard_id)
  end
end
