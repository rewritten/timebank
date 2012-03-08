require "spec_helper"

describe TransactionSummariesController do
  describe "routing" do

    it "routes to #index" do
      get("/transaction_summaries").should route_to("transaction_summaries#index")
    end

    it "routes to #new" do
      get("/transaction_summaries/new").should route_to("transaction_summaries#new")
    end

    it "routes to #show" do
      get("/transaction_summaries/1").should route_to("transaction_summaries#show", :id => "1")
    end

    it "routes to #edit" do
      get("/transaction_summaries/1/edit").should route_to("transaction_summaries#edit", :id => "1")
    end

    it "routes to #create" do
      post("/transaction_summaries").should route_to("transaction_summaries#create")
    end

    it "routes to #update" do
      put("/transaction_summaries/1").should route_to("transaction_summaries#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/transaction_summaries/1").should route_to("transaction_summaries#destroy", :id => "1")
    end

  end
end
