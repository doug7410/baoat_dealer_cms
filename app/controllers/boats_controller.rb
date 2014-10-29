class BoatsController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    @boat = Boat.find(params[:id])
    @brand = @boat.brand
    packages = BoatMotorPackage.where(boat: @boat).all

    @package_motor_brands = packages.map(&:brand).uniq
    
    # @package_motor_brands = packages.map { |p| p.motor.brand }
    # binding.pry
  end
end