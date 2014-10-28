require 'rails_helper'
include Warden::Test::Helpers
Warden.test_mode!

feature "User views a boat page and sees boat data" do
  scenario "an unauthenticated user can not see the boat page" do
    carolina_skiff = Fabricate(:brand)
    jvx16 = Fabricate(:boat, brand: carolina_skiff)
    visit boat_path(jvx16)
    expect(page).to have_content("Please Enter Your Information")
  end

  scenario "A logged in user can see the boat standard features on the page" do
    carolina_skiff = Fabricate(:brand)
    jvx16 = Fabricate(:boat, brand: carolina_skiff)
    rod_holder = Fabricate(:standard_feature, name: "rod holders")
    jvx16.standard_features << [rod_holder]

    bob = Fabricate(:user)
    login_as(bob, :scope => :user)

    visit boat_path(jvx16)

    expect(page).to have_content("rod holders")
  end


end