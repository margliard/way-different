class ExperiencesController < ApplicationController

  def index
    @experience.all
  end

  def show
    authorize @experience # for pundit
  end
end
