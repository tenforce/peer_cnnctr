require "spec_helper"

describe PeerGroupsController do
  describe "routing" do

    it "routes to #index" do
      get("/peer_groups").should route_to("peer_groups#index")
    end

    it "routes to #new" do
      get("/peer_groups/new").should route_to("peer_groups#new")
    end

    it "routes to #show" do
      get("/peer_groups/1").should route_to("peer_groups#show", :id => "1")
    end

    it "routes to #edit" do
      get("/peer_groups/1/edit").should route_to("peer_groups#edit", :id => "1")
    end

    it "routes to #create" do
      post("/peer_groups").should route_to("peer_groups#create")
    end

    it "routes to #update" do
      put("/peer_groups/1").should route_to("peer_groups#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/peer_groups/1").should route_to("peer_groups#destroy", :id => "1")
    end

  end
end
