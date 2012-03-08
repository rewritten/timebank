require "spec_helper"

describe AccountStatusesController do
  describe "routing" do

    it "routes to #index" do
      get("/account_statuses").should route_to("account_statuses#index")
    end

    it "routes to #new" do
      get("/account_statuses/new").should route_to("account_statuses#new")
    end

    it "routes to #show" do
      get("/account_statuses/1").should route_to("account_statuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/account_statuses/1/edit").should route_to("account_statuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/account_statuses").should route_to("account_statuses#create")
    end

    it "routes to #update" do
      put("/account_statuses/1").should route_to("account_statuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/account_statuses/1").should route_to("account_statuses#destroy", :id => "1")
    end

  end
end
