class CreateBoatStandardFeatures < ActiveRecord::Migration
  def change
    create_table :boat_standard_features do |t|
      t.belongs_to :boat
      t.belongs_to :standard_feature
      t.timestamp
    end
  end
end
