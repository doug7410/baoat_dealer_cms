class AddActiveToBoatBrands < ActiveRecord::Migration
  def change
    add_column :boat_brands, :active, :boolean, default: true
  end
end
