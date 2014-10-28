class BoatsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @boat = Boat.find(params[:id])
    @brand = @boat.brand
    @packages = BoatMotorPackage.where(boat: @boat).all
  end
end