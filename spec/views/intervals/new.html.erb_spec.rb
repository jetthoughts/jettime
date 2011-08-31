require 'spec_helper'

describe "intervals/new.html.erb" do
  before(:each) do
    assign(:interval, stub_model(Interval,
      :message => "MyText",
      :project => ""
    ).as_new_record)
  end

  it "renders new interval form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => intervals_path, :method => "post" do
      assert_select "textarea#interval_message", :name => "interval[message]"
      assert_select "input#interval_project", :name => "interval[project]"
    end
  end
end
