class CreateBoatMotorPackage < ActiveRecord::Migration
  def change
    create_table :boat_motor_packages do |t|
      t.integer :boat_id
      t.integer :motor_id
      t.integer :price_in_cents
      t.timestamps
    end
  end
end
