class ChangeBoatBrandIdToBrandIdInBoats < ActiveRecord::Migration
  def change
    rename_column :boats, :boat_brand_id, :brand_id
  end
end
