class BoatBrandsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_all_boat_brands, only: [:create, :index]
  before_action :toggle_active_and_redirect, only: [:activate, :deactivate]

  def index
    @boat_brand = BoatBrand.new
  end

  def create
    boat_brand = BoatBrand.new(boat_brand_params)
    if boat_brand.save
      flash[:success] = "A new boat brands has been added"
      redirect_to boat_brands_path
    else
      flash[:warning] = "Please fix the error below."
      @boat_brand = boat_brand
      render :index
    end
  end

  def edit
    @boat_brand = boat_brand
  end

  def update
    @boat_brand = boat_brand

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
  end

  def deactivate
  end 

  def destroy
    boat_brand.destroy
    redirect_to boat_brands_path
  end

  private

  def boat_brand_params
    params.require(:boat_brand).permit(:name, :logo, :description)
  end 

  def boat_brand
    BoatBrand.find(params[:id])    
  end

  def get_all_boat_brands
    @active_boat_brands = BoatBrand.where(active: true).all
    @inactive_boat_brands = BoatBrand.where(active: false)
  end

  def toggle_active_and_redirect
    boat_brand.toggle_active!
    redirect_to boat_brands_path
  end
end