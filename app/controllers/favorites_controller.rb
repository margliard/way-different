class FavoritesController < ApplicationController
  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.travelboard = @travelboard
    if @favorite.save
      redirect_to travelboard_path(@travelboard)
    else
      render :new
    end
  end

  def destroy
    @favorite.destroy
    redirect_to travelboard_path(@favorite.travelboard)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:comment, :experience_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def set_travelboard
    @travelboard = travelboard.find(params[:travelboard_id])
  end
end
