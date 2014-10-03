require 'rails_helper'

describe BoatBrand do
  
  it { should validate_presence_of(:name)}
  # it { should validate_presence_of(:logo)}
  it { should validate_presence_of(:description)}

  describe "toggle_active!" do
    it "should set active to true if it's presently false" do
      carolina_skiff = Fabricate(:boat_brand, active: false)
      carolina_skiff.toggle_active!
      expect(carolina_skiff.active).to eq(true)
    end
    it "should not set active to true if it's allready true" do
      carolina_skiff = Fabricate(:boat_brand)
      carolina_skiff.toggle_active!
      expect(carolina_skiff.active).to eq(false)
    end
  end 
end