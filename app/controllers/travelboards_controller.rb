class TravelboardsController < ApplicationController
  def index
    @travelboards = Travelboard.all
  end

  def show
    @travelboard = Travelboard.find(params[:id])
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
    @travelboard = Travelboard.new(travelboard_params)
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
    params.require(:travelboard).permit(:name, :user_id, :start_date, :end_date, :status) #
  end

end
