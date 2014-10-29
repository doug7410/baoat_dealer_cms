class Boat < ActiveRecord::Base
  belongs_to :brand  
  has_many :boat_motor_packages
  has_many :boat_standard_features
  has_many :standard_features, through: :boat_standard_features
  has_many :boat_upgrade_options
  has_many :upgrade_options, through: :boat_upgrade_options

  def motor_packages(brand)
    BoatMotorPackage.where(boat: self, brand: brand).all
  end
end
