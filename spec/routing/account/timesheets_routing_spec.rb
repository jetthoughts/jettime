require "spec_helper"

describe Account::TimesheetsController do
  describe "routing" do

    it "routes to #index" do
      get("http://some.cc.ua/timesheets").should route_to("account/timesheets#index")
    end

    it "routes to #new" do
      get("http://some.cc.ua/timesheets/new").should route_to("account/timesheets#new")
    end

    it "routes to #show" do
      get("http://some.cc.ua/timesheets/1").should route_to("account/timesheets#show", :id => "1")
    end

    it "routes to #edit" do
      get("http://some.cc.ua/timesheets/1/edit").should route_to("account/timesheets#edit", :id => "1")
    end

    it "routes to #create" do
      post("http://some.cc.ua/timesheets").should route_to("account/timesheets#create")
    end

    it "routes to #update" do
      put("http://some.cc.ua/timesheets/1").should route_to("account/timesheets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("http://some.cc.ua/timesheets/1").should route_to("account/timesheets#destroy", :id => "1")
    end

  end

  describe "paths" do
    it "correct path #staff_index_path" do
      timesheets_path.should eq("/timesheets")
    end
  end

end
