class BoatBrand < ActiveRecord::Base

  validates_presence_of :name, :logo, :description 
end