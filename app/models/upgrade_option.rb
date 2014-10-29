class UpgradeOption < ActiveRecord::Base
  has_many :boat_upgrade_options
  has_many :boats, through: :boat_upgrade_options

  validates_presence_of :name, :price_in_cents
end