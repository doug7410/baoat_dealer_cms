class UpdateBoatMainModelImages < ActiveRecord::Migration
  def change
    rename_column :boat_main_models, :small_image, :small_model_image
    rename_column :boat_main_models, :large_image, :large_model_image
  end
end
