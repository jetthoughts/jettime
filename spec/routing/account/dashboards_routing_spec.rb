require "spec_helper"

describe Account::DashboardsController do
  describe "routing" do

    it "routes to #index" do
      get("http://foo.test.host/").should route_to("account/dashboards#show")
    end

  end

  describe "paths" do
    it "correct path #account_dashboard_url" do
      account_root_url(:host => "example.com").should eq("http://example.com/")
    end
  end
end
