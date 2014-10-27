class CreateBoats < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.integer :brand_id
      t.string :name
      t.timestamps
    end
  end
end
