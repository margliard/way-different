class PagesController < ApplicationController
  def home
    @experiences = Experience.where(params[:id])
    @travelboards = Travelboard.where(params[:id])
  end
end
