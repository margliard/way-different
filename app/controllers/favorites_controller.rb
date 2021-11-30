class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:destroy, :changeday]
  before_action :set_experience, only: [:new, :create]

  def new
    @favorite = Favorite.new
  end

  def create
    @travelboard = Travelboard.find(params[:travelboard_id])
    @travelday = Travelday.create(day_number: 0, travelboard: @travelboard)
    @favorite = Favorite.create(experience: @experience, travelday: @travelday)
    redirect_to experience_path(@experience)
  end

  def destroy
    @favorite.destroy
    redirect_to travelboard_path(@favorite.travelboard)
  end

  def changeday
    @travelday = Travelday.find(params[:travelday])
    @favorite.travelday = @travelday
    @favorite.save
    authorize @favorite
  end

  private

  def favorite_params
    params.require(:favorite).permit(:experience_id, :travelday_id)
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
