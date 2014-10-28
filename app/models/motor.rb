class Motor < ActiveRecord::Base
  belongs_to :brand
  has_many :boat_motor_packages

  validates_presence_of :name, :hp, :shaft, :motor_type, :brand
end