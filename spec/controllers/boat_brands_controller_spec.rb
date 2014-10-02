require 'rails_helper'

describe BoatBrandsController do
  describe "GET index" do
    it "sets the @brands to all the brands" do
      carolina_skiff = Fabricate(:boat_brand)
      lowe = Fabricate(:boat_brand)
      get :index   
      expect(assigns(:brands).count).to eq(2) 
    end

    it "sets @boat_brand to a new BoatBrand" do
      get :index
      expect(assigns(:boat_brand)).to be_new_record
      expect(assigns(:boat_brand)).to be_instance_of(BoatBrand)
    end

    it "renders the boat brands inxex template" do
      get :index
      expect(response).to render_template :index
    end 
  end

  describe "POST create" do
    context "with valid input" do
      it "redirects to the boat brands index page" do 
        post :create, boat_brand: {name: "Carolina Skiff", logo: "logo.jog", description: "a great brand of boat"}
        expect(response).to redirect_to boat_brands_path
      end
      it "creates a new boat brand" do
        post :create, boat_brand: {name: "Carolina Skiff", logo: "logo.jog", description: "a great brand of boat"}
        expect(BoatBrand.count).to eq(1)
      end
      it "sets the flash message" do 
        post :create, boat_brand: {name: "Carolina Skiff", logo: "logo.jog", description: "a great brand of boat"}
        expect(flash[:success]).not_to be_nil
      end
    end
    
    context "with invalid input" do
      it "does not create a new boat brand" do
        post :create, boat_brand: {name: "Carolina Skiff"}
        expect(BoatBrand.count).to eq(0)
      end

      it "renders the boat brands index page" do 
        post :create, boat_brand: {name: "Carolina Skiff"}
        expect(response).to render_template :index
      end

      it "sets the @brands to all the brands" do
        carolina_skiff = Fabricate(:boat_brand)
        lowe = Fabricate(:boat_brand)
        post :create, boat_brand: {name: "Carolina Skiff"}
        expect(assigns(:brands).count).to eq(2) 
      end

      it "sets @boat_brand to a new BoatBrand" do
        post :create, boat_brand: {name: "Carolina Skiff"}
        expect(assigns(:boat_brand)).to be_new_record
        expect(assigns(:boat_brand)).to be_instance_of(BoatBrand)
      end
    end 
  end
end 