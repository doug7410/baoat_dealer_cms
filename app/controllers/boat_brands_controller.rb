class BoatBrandsController < ApplicationController
  before_action :authenticate_user!

  def index
    @brands = BoatBrand.all
    @boat_brand = BoatBrand.new
  end

  def create
    boat_brand = BoatBrand.new(params.require(:boat_brand).permit(:name, :logo, :description))
    if boat_brand.save
      flash[:success] = "A new boat brands has been added"
      redirect_to boat_brands_path
    else
      @brands = BoatBrand.all
      @boat_brand = BoatBrand.new
      render :index
    end
  end
end