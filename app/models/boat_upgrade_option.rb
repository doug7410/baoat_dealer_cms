class BoatUpgradeOption < ActiveRecord::Base
  belongs_to :boat
  belongs_to :upgrade_option
end