class RenameBrandToBoatBrandInBoats < ActiveRecord::Migration
  def change
    rename_column :boats, :brand_id, :boat_brand_id
  end
end
