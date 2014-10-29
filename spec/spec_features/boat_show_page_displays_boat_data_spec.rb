require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!



feature "User views a boat page and sees boat data" do

  background do
    bob = Fabricate(:user)
    login_as(bob, :scope => :user) 
  end

  given(:carolina_skiff) { Fabricate(:brand) }
  given(:jvx16) { Fabricate(:boat, brand: carolina_skiff, price_in_cents: 554000, message: "this is a message about the boat") } 

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
    expect(page).to have_content("$5,540")     
    expect(page).to have_content("this is a message about the boat")      
  end

  scenario "[a logged in user can see the upgrade options]" do
    bimini_top = Fabricate(:upgrade_option, name: "Bimini Top", price_in_cents: 25000, cost_in_cents: 15700)
    rod_holders = Fabricate(:upgrade_option, name: "Rod Holders", price_in_cents: 22000, cost_in_cents: 15400)
    jvx16.upgrade_options << [bimini_top, rod_holders]

    visit boat_path(jvx16)
     
    expect(page).to have_content("Bimini Top")
    expect(page).to have_content("Rod Holders")
    expect(page).to have_content("$220")
    expect(page).to have_content("$157")
  end
 

end