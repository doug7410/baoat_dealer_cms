class BoatsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @boat = Boat.find(params[:id])
    @brand = @boat.brand
  end
end