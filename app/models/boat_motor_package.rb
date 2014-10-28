class BoatMotorPackage < ActiveRecord::Base
  belongs_to :boat
  belongs_to :motor

  validates_presence_of :boat, :motor, :price_in_cents
end