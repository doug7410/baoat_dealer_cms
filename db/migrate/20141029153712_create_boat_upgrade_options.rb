class CreateBoatUpgradeOptions < ActiveRecord::Migration
  def change
    create_table :boat_upgrade_options do |t|
      t.integer :boat_id
      t.integer :upgrade_option_id
      t.timestamps
    end
  end
end
