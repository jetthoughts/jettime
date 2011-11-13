require "spec_helper"

describe Account::StaffController do
  describe "routing" do

    it "routes to #index" do
      get("http://foo.test.host/staff").should route_to("account/staff#index")
      get("http://foo.test.host/staff/1").should route_to({:controller => "account/staff", :action => "show", :id => "1"})
    end

  end

  describe "paths" do
    it "correct path #account_staff_index_path" do
      staff_index_path().should eq("/staff")
    end
  end
end
