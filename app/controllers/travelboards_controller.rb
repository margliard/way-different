class TravelboardsController < ApplicationController
  def index
    @travelboards = Travelboard.all
  end

  def show
    @travelboard = Travelboard.find(params[:id])
  end

  def new
    @travelboard = TravelBoard.new
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
