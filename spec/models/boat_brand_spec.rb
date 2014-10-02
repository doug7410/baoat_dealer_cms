require 'rails_helper'

describe BoatBrand do
  
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:logo)}
  it { should validate_presence_of(:description)}
end