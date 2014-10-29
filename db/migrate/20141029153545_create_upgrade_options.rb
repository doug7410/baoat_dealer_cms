class CreateUpgradeOptions < ActiveRecord::Migration
  def change
    create_table :upgrade_options do |t|
      t.string :name
      t.integer :price_in_cents
      t.integer :cost_in_cents
      t.timestamps
    end
  end
end
