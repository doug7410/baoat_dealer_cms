class AddActiveToBoatMainModels < ActiveRecord::Migration
  def change
    add_column :boat_main_models, :active, :boolean, default: true
  end
end
