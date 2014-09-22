class BoatBrandsController < ApplicationController
  def index
    @brands = BoatBrand.all
  end
end