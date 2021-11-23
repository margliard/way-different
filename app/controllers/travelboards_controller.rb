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
    @travelboard = Travelboard.new
  end

  def edit
  end

  def udpate
  end

  def destroy
  end

end
