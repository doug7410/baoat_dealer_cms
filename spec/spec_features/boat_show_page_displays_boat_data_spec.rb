require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!



feature "User views a boat page and sees boat data" do

  background do
    bob = Fabricate(:user)
    login_as(bob, :scope => :user)
  end

  given(:carolina_skiff) { Fabricate(:brand) }
  given(:jvx16) { Fabricate(:boat, brand: carolina_skiff) } 

  scenario "an unauthenticated user can not see the boat page" do
    logout(:user)
    visit boat_path(jvx16)
    expect(page).to have_content("Please Enter Your Information")
  end

  scenario "[A logged in user can see the boat standard features]" do
    rod_holder = Fabricate(:standard_feature, name: "rod holders")
    jvx16.standard_features << [rod_holder]

    visit boat_path(jvx16)

    expect(page).to have_content("rod holders")
  end
 
  scenario "[a logged in user can see the motors packages]" do
    evinrude = Fabricate(:brand, name: "Evinrude")
    mercury = Fabricate(:brand, name: "Mercury")
    motor1 = Fabricate(:motor, brand: evinrude, hp: "50")
    motor2 = Fabricate(:motor, brand: mercury, hp: "50")
    motor_package1 = Fabricate(:boat_motor_package, motor: motor1, boat: jvx16, brand: evinrude, price_in_cents: 999900)
    motor_package2 = Fabricate(:boat_motor_package, motor: motor2, boat: jvx16, brand: mercury,  price_in_cents: 999900)
 
    visit boat_path(jvx16)

    expect(page).to have_content("Evinrude")
    expect(page).to have_content("Mercury") 
    expect(page).to have_content("50HP")  
    expect(page).to have_content("$9,999")     
  end
 

end