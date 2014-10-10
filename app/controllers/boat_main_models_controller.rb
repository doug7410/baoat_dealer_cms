class BoatMainModelsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @active_boat_main_models = BoatMainModel.where(active: true).all
    @inactive_boat_main_models = BoatMainModel.where(active: false).all
  end 

  def new
    @boat_main_model = BoatMainModel.new
  end

  def create
    redirect_to boat_main_model_path
  end

end 