class StandardFeature < ActiveRecord::Base
  belongs_to :boat
  has_many :boat_standard_features
  has_many :boats, through: :boat_standard_features

end