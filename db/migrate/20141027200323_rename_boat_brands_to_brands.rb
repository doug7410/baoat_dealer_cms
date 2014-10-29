class RenameBoatBrandsToBrands < ActiveRecord::Migration
  def change
    rename_table :boat_brands, :brands
  end
end
