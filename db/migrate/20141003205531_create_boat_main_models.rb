class CreateBoatMainModels < ActiveRecord::Migration
  def change
    create_table :boat_main_models do |t|
      t.string :name
      t.string :small_image
      t.string :large_image
      t.text :description
      t.integer :brand_id
      t.timestamps
    end
  end
end
