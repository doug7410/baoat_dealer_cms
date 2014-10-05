class BoatMainModel < ActiveRecord::Base
  belongs_to :boat_brand

  validates_presence_of :name, :small_model_image, :large_model_image, :description

  mount_uploader :small_model_image, SmallModelImageUploader
  mount_uploader :large_model_image, LargeModelImageUploader

end