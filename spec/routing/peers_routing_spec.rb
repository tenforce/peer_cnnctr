require "spec_helper"

describe PeersController do
  describe "routing" do

    it "routes to #index" do
      get("/peers").should route_to("peers#index")
    end

    it "routes to #new" do
      get("/peers/new").should route_to("peers#new")
    end

    it "routes to #show" do
      get("/peers/1").should route_to("peers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/peers/1/edit").should route_to("peers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/peers").should route_to("peers#create")
    end

    it "routes to #update" do
      put("/peers/1").should route_to("peers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/peers/1").should route_to("peers#destroy", :id => "1")
    end

  end
end
