require 'rails_helper'

describe BoatBrandsController do
  describe "GET index" do
    it "sets the @brands to all the brands" do
      carolina_skiff = Fabricate(:boat_brand)
      lowe = Fabricate(:boat_brand)
      get :index   
      expect(assigns(:brands).count).to eq(2) 
    end

    it "renders the boat brands inxex template" do
      get :index
      expect(response).to render_template :index
    end 
  end
end 