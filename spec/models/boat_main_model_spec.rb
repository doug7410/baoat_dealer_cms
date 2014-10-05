require 'rails_helper'

describe BoatMainModel do
  
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:small_model_image)}
  it { should validate_presence_of(:large_model_image)}
  it { should validate_presence_of(:description)}
 
end