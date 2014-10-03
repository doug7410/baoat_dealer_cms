class BoatBrandsController < ApplicationController
  before_action :authenticate_user!

  def index
    @active_boat_brands = BoatBrand.where(active: true).all
    @inactive_boat_brands = BoatBrand.where(active: false).all
    @boat_brand = BoatBrand.new
  end

  def create
    boat_brand = BoatBrand.new(boat_brand_params)
    if boat_brand.save
      flash[:success] = "A new boat brands has been added"
      redirect_to boat_brands_path
    else
      @brands = BoatBrand.all
      @boat_brand = BoatBrand.new
      render :index
    end
  end

  def edit
    @boat_brand = BoatBrand.find(params[:id])
  end

  def update
    @boat_brand = BoatBrand.find(params[:id])

    @boat_brand.update(boat_brand_params)
    
    if @boat_brand.save
      flash[:success] = "#{@boat_brand.name} has been updated."
      redirect_to boat_brands_path
    else
      flash[:warning] = "please fix the errors below."
      render :edit
    end
  end

  def activate
    boat_brand = BoatBrand.find(params[:id])
    boat_brand.update_column(:active, true)
    redirect_to boat_brands_path
  end

  def deactivate
    boat_brand = BoatBrand.find(params[:id])
    boat_brand.update_column(:active, false)
    redirect_to boat_brands_path
  end 

  private

  def boat_brand_params
    params.require(:boat_brand).permit(:name, :logo, :description)
  end 
end