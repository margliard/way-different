class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @experiences = Experience.where(params[:id])
    @travelboards = Travelboard.where(params[:id])
  end

  def carbon
    @experiences = Experience.where(params[:id])
    @travelboards = Travelboard.where(params[:id])
  end

end
