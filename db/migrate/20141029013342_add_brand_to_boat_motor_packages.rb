class AddBrandToBoatMotorPackages < ActiveRecord::Migration
  def change
    add_column :boat_motor_packages, :brand_id, :integer
  end
end
