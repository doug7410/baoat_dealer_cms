require 'rails_helper'

describe BoatsController do
  describe "GET show" do
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
  end
end 