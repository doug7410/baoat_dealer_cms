class BoatsController < ApplicationController
  def show
    @boat = Boat.find(params[:id])
    @brand = @boat.brand
  end
end