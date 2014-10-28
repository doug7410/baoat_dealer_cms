class Boat < ActiveRecord::Base
  belongs_to :brand
  has_many :boat_standard_features
  has_many :boat_motor_packages
  has_many :standard_features, through: :boat_standard_features
end