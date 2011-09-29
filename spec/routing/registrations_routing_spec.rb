require "spec_helper"

describe RegistrationsController do
  describe "routing" do

    it "routes to #create" do
      post("/users").should route_to("registrations#create")
    end

    it "routes to #new" do
      get("/users/sign_up").should route_to("registrations#new")
    end

  end
end
