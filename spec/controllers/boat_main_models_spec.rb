require 'rails_helper'

describe BoatMainModelsController do
  describe "GET index" do
    before { sign_in Fabricate(:user)}

    it "sets @active_boat_main_models" do
      jvx = Fabricate(:boat_main_model) 
      get :index
      expect(assigns(:active_boat_main_models)).to eq([jvx])
    end 

    it "sets @inactive_boat_main_models" do
      jvx = Fabricate(:boat_main_model, active: false) 
      get :index
      expect(assigns(:inactive_boat_main_models)).to eq([jvx])
    end
  end

  describe "GET new" do
    before { sign_in Fabricate(:user)} 

    it "sets the @boat_main_model" do
      get :new
      expect(assigns(:boat_main_model)).to be_instance_of(BoatMainModel)
      expect(assigns(:boat_main_model)).to be_new_record 
    end 
  end

  describe "GET create" do
    
  end 

end
