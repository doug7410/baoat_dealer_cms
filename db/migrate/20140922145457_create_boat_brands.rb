class CreateBoatBrands < ActiveRecord::Migration
  def change
    create_table :boat_brands do |t|
      t.string :name, :logo
      t.text :description
      t.timestamps
    end
  end
end
