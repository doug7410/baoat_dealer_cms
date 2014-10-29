require 'spec_helper'
include Warden::Test::Helpers

describe BoatsController do
  describe "GET show" do
    before { sign_in Fabricate(:user)}

    it "[sets the @boat]" do
      jvx16 = Fabricate(:boat)
      get :show, id: jvx16.id
      expect(assigns(:boat)).to eq(jvx16)
    end

    it "[sets the @brand]" do
      carolina_skiff = Fabricate(:brand)
      jvx16 = Fabricate(:boat, brand: carolina_skiff)
      get :show, id: jvx16.id
      expect(assigns(:brand)).to eq(carolina_skiff)
    end

    # it "[sets the @packages associted with the boat]" do
    #   carolina_skiff = Fabricate(:brand)
    #   jvx16 = Fabricate(:boat, brand: carolina_skiff)
      
    #   evinrude = Fabricate(:brand)
    #   motor1 = Fabricate(:motor, brand: evinrude)
    #   motor2 = Fabricate(:motor, brand: evinrude)
    #   package1 = Fabricate(:boat_motor_package, boat: jvx16, motor: motor1)
    #   package2 = Fabricate(:boat_motor_package, boat: jvx16, motor: motor2)

    #   get :show, id: jvx16.id
    #   expect(assigns(:packages)).to eq([package1, package2])
    # end

    it "sets @package_motor_brands" do
      carolina_skiff = Fabricate(:brand)
      jvx16 = Fabricate(:boat, brand: carolina_skiff)
      
      evinrude = Fabricate(:brand)
      mercury = Fabricate(:brand)
      motor1 = Fabricate(:motor, brand: evinrude)
      motor2 = Fabricate(:motor, brand: mercury)
      package1 = Fabricate(:boat_motor_package, boat: jvx16, motor: motor1, brand: evinrude)
      package2 = Fabricate(:boat_motor_package, boat: jvx16, motor: motor2, brand: mercury)

      get :show, id: jvx16.id
      expect(assigns(:package_motor_brands)).to eq([evinrude, mercury])

    end
  end
end 