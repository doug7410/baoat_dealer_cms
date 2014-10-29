class RenameBoatOnlyPrice < ActiveRecord::Migration
  def change
    rename_column :boats, :boat_only_price, :price_in_cents
  end
end
