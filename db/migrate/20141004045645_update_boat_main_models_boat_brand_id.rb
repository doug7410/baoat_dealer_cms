class UpdateBoatMainModelsBoatBrandId < ActiveRecord::Migration
  def change
    rename_column :boat_main_models, :brand_id, :boat_brand_id
  end
end
