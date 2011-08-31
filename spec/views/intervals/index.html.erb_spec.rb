require 'spec_helper'

describe "intervals/index.html.erb" do
  before(:each) do
    assign(:intervals, [
      stub_model(Interval,
        :message => "MyText",
        :project => ""
      ),
      stub_model(Interval,
        :message => "MyText",
        :project => ""
      )
    ])
  end

  it "renders a list of intervals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
