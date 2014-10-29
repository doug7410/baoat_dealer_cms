class CreateStandardFeatrues < ActiveRecord::Migration
  def change
    create_table :standard_features do |t|
      t.string :name
      t.timestamps
    end
  end
end
