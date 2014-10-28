require 'rails_helper'

describe Boat do
  
  it { should have_many(:standard_features)}

  it "returns all standard features associated with the boat" do
    jvx16 = Fabricate(:boat)
    horn = Fabricate(:standard_feature)
    windshield = Fabricate(:standard_feature)

    jvx16.standard_features << [horn, windshield]

    expect(jvx16.standard_features).to eq([horn, windshield])
  end
   
end