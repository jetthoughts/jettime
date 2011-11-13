require "spec_helper"

describe Account::ProjectsController do
  describe "routing" do

    it "routes to #index" do
      get("http://some.cc.ua/projects").should route_to("account/projects#index")
    end

    it "routes to #new" do
      get("http://some.cc.ua/projects/new").should route_to("account/projects#new")
    end

    it "routes to #show" do
      get("http://some.cc.ua/projects/1").should route_to("account/projects#show", :id => "1")
    end

    it "routes to #edit" do
      get("http://some.cc.ua/projects/1/edit").should route_to("account/projects#edit", :id => "1")
    end

    it "routes to #create" do
      post("http://some.cc.ua/projects").should route_to("account/projects#create")
    end

    it "routes to #update" do
      put("http://some.cc.ua/projects/1").should route_to("account/projects#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("http://some.cc.ua/projects/1").should route_to("account/projects#destroy", :id => "1")
    end

  end

  describe "paths" do
    it "correct path #staff_index_path" do
      projects_path.should eq("/projects")
    end
  end

end
