class FavoritesController < ApplicationController
  before_action :set_favorite, only: :destroy
  before_action :set_experience, only: [:new, :create]

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

  def update

  end

  private

  def favorite_params
    params.require(:favorite).permit(:experience_id)
  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def set_travelboard
    @travelboard = Travelboard.find(params[:travelboard_id])
  end

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end
end
