require 'spec_helper'

describe "intervals/show.html.erb" do
  before(:each) do
    @interval = assign(:interval, stub_model(Interval,
      :message => "MyText",
      :project => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
