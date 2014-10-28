class CreateMotors < ActiveRecord::Migration
  def change
    create_table :motors do |t|
      t.string :name
      t.string :hp
      t.integer :shaft
      t.string :type
      t.integer :brand_id
      t.timestamps
    end
  end
end
