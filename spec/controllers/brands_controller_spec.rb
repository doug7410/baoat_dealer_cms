require 'rails_helper'
include Warden::Test::Helpers

describe BrandsController do
  describe "GET index" do
    before { sign_in Fabricate(:user)}

    it "sets @active_brands to all the active brands" do
      carolina_skiff = Fabricate(:brand)
      lowe = Fabricate(:brand, active: false)
      get :index   
      expect(assigns(:active_brands).count).to eq(1)
    end

    it "sets @inactive_brands to all the inactive brands" do
      carolina_skiff = Fabricate(:brand)
      lowe = Fabricate(:brand, active: false)
      get :index   
      expect(assigns(:inactive_brands).count).to eq(1)
    end

    it "sets @brand to a new BoatBrand" do
      get :index
      expect(assigns(:brand)).to be_new_record
      expect(assigns(:brand)).to be_instance_of(BoatBrand)
    end

    it "renders the boat brands inxex template" do
      get :index
      expect(response).to render_template :index
    end 
  end

  describe "POST create" do
    before { sign_in Fabricate(:user)}

    context "with valid input" do
      it "redirects to the boat brands index page" do 
        post :create, brand: {name: "Carolina Skiff", logo: "logo.jog", description: "a great brand of boat"}
        expect(response).to redirect_to brands_path
      end
      it "creates a new boat brand" do
        post :create, brand: {name: "Carolina Skiff", logo: "logo.jog", description: "a great brand of boat"}
        expect(BoatBrand.count).to eq(1)
      end
      it "sets the flash message" do 
        post :create, brand: {name: "Carolina Skiff", logo: "logo.jog", description: "a great brand of boat"}
        expect(flash[:success]).not_to be_nil
      end
    end
    
    context "with invalid input" do
      it "does not create a new boat brand" do
        post :create, brand: {name: "Carolina Skiff"}
        expect(BoatBrand.count).to eq(0)
      end

      it "renders the boat brands index page" do 
        post :create, brand: {name: "Carolina Skiff"}
        expect(response).to render_template :index
      end
    end
  end

  describe "GET edit" do
    before { sign_in Fabricate(:user)}

    # it "redirects to the sign in page for unauthenticated users" do
    #   bob = Fabricate(:user)
    #   sign_out bob
    #   carolina_skiff = Fabricate(:brand)
    #   get :edit, id: carolina_skiff.id
    #   expect(response).to redirect_to new_user_session_path
    # end

    it "sets the @brand" do
      carolina_skiff = Fabricate(:brand)
      get :edit, id: carolina_skiff.id
      expect(assigns(:brand)).to eq(carolina_skiff)
    end
  end 
 
  describe "PATCH update" do
    before { sign_in Fabricate(:user) }
    
    context "with valid input" do
      let(:carolina_skiff) { Fabricate(:brand, name: "Carolina Skiff")}
      let(:http_request) do
        patch :update, id: carolina_skiff.id, brand: {name: "Lowe", logo: carolina_skiff.logo, description: carolina_skiff.description }
      end

      it "redirects to the boat brand index page" do 
        http_request
        expect(response).to redirect_to brands_path 
      end

      it "updates the boat brand" do
        http_request
        expect(carolina_skiff.reload.name).to eq("Lowe")
      end

      it "sets the flash success message" do
        
        http_request
        expect(flash[:success]).to_not be_nil
      end
    end

    context "with invalid input" do
      let(:carolina_skiff) { Fabricate(:brand, name: "Carolina Skiff")}

      it "renders the edit boat brand page" do
        patch :update, id: carolina_skiff.id, brand: {name: "" }
        expect(response).to render_template :edit
      end
      it "sets the @brand" do
        patch :update, id: carolina_skiff.id, brand: {name: "" }
        expect(assigns(:brand)).to eq(carolina_skiff)
      end
      it "sets the flash error message" do
        patch :update, id: carolina_skiff.id, brand: {name: "" }
        expect(flash[:warning]).not_to be_nil
      end
    end
  end

  describe "POST activate" do
    before { sign_in Fabricate(:user) }

    it "redirects to the boat brand index page" do
      carolina_skiff = Fabricate(:brand, active: false)
      post :activate, id: carolina_skiff.id
      expect(response).to redirect_to brands_path 

    end

    it "sets the brand active column to true" do
      carolina_skiff = Fabricate(:brand, active: false)
      post :activate, id: carolina_skiff.id
      expect(carolina_skiff.reload.active).to eq(true) 
    end
  end

  describe "POST deactivate" do
    before { sign_in Fabricate(:user) }

    it "redirects to the boat brand index page" do
      carolina_skiff = Fabricate(:brand, active: true)
      post :deactivate, id: carolina_skiff.id
      expect(response).to redirect_to brands_path 
    end

    it "sets the brand active column to false" do
      carolina_skiff = Fabricate(:brand, active: true)
      post :deactivate, id: carolina_skiff.id
      expect(carolina_skiff.reload.active).to eq(false) 
    end
  end

  describe "DELETE destroy" do
    before { sign_in Fabricate(:user) }

    it "redirects to the boat brands page" do
      carolina_skiff = Fabricate(:brand)
      delete :destroy, id: carolina_skiff.id
      expect(response).to redirect_to brands_path
    end

    it "deltes the boat brand" do 
      carolina_skiff = Fabricate(:brand)
      delete :destroy, id: carolina_skiff.id
      expect(BoatBrand.count).to eq(0) 
    end
  end


end 