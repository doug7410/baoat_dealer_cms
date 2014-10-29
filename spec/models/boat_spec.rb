require 'spec_helper'

describe Boat do
  
  it { should have_many(:standard_features)}

  it "returns all standard features associated with the boat" do
    jvx16 = Fabricate(:boat)
    horn = Fabricate(:standard_feature)
    windshield = Fabricate(:standard_feature)

    jvx16.standard_features << [horn, windshield]

    expect(jvx16.standard_features).to eq([horn, windshield])
  end

  describe ".motor_packages(brand)" do
    it "[returns all the boat_motor_packages associated with the boat and brand]" do
      jvx16 = Fabricate(:boat)
      evinrude = Fabricate(:brand)
      motor1 = Fabricate(:motor, brand: evinrude)
      motor2 = Fabricate(:motor, brand: evinrude)
      package1 = Fabricate(:boat_motor_package, boat: jvx16, motor: motor1, brand: evinrude)
      package2 = Fabricate(:boat_motor_package, boat: jvx16, motor: motor2, brand: evinrude)

      packges = jvx16.motor_packages(evinrude)

      expect(packges).to eq([package1, package2])

    end

    it "[does not return any boat_motor_packages that are not associated withthe boat]" do
      jvx16 = Fabricate(:boat)
      jvx18 = Fabricate(:boat)
      evinrude = Fabricate(:brand)
      motor1 = Fabricate(:motor, brand: evinrude)
      motor2 = Fabricate(:motor, brand: evinrude)
      package1 = Fabricate(:boat_motor_package, boat: jvx16, motor: motor1, brand: evinrude)
      package2 = Fabricate(:boat_motor_package, boat: jvx18, motor: motor2, brand: evinrude)

      packges = jvx16.motor_packages(evinrude)

      expect(packges).to eq([package1])
    end

    it "[does not return any boat_motor_packages that are not associated with the brand]" do
      jvx16 = Fabricate(:boat)
      evinrude = Fabricate(:brand)
      mercury = Fabricate(:brand)
      motor1 = Fabricate(:motor, brand: evinrude)
      motor2 = Fabricate(:motor, brand: mercury)
      package1 = Fabricate(:boat_motor_package, boat: jvx16, motor: motor1, brand: evinrude)
      package2 = Fabricate(:boat_motor_package, boat: jvx16, motor: motor2, brand: mercury)

      packges = jvx16.motor_packages(evinrude)

      expect(packges).to eq([package1])
    end
  end
   
end