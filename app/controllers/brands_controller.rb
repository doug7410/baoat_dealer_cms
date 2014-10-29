class BrandsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_all_boats, only: [:create, :index]
  before_action :toggle_active_and_redirect, only: [:activate, :deactivate]

  def index
    @brand = Brand.new
  end

  def create
    boat = Brand.new(brand_params)
    if boat.save
      flash[:success] = "A new boat brands has been added"
      redirect_to boats_path
    else
      flash[:warning] = "Please fix the error below."
      @brand = boat
      render :index
    end
  end

  def edit
    @brand = boat
  end

  def update
    @brand = boat

    @brand.update(boat_params)
    
    if @brand.save
      flash[:success] = "#{@brand.name} has been updated."
      redirect_to boats_path
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
    boat.destroy
    redirect_to boats_path
  end

  private

  def brand_params
    params.require(:boat).permit(:name, :logo, :description)
  end 

  def brand
    BoatBrand.find(params[:id])    
  end

  def get_all_boats
    @active_boats = BoatBrand.where(active: true).all
    @inactive_boats = BoatBrand.where(active: false)
  end

  def toggle_active_and_redirect
    boat.toggle_active!
    redirect_to boats_path
  end
end