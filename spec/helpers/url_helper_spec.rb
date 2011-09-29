require "spec_helper"

describe UrlHelper do

  it "should generate correct url with subdomain" do
    @request.host = "test.host:3000"

    new_user_session_url.should == "http://test.host:3000/users/sign_in"
    new_user_session_url(:subdomain => "ttt").should == "http://ttt.test.host:3000/users/sign_in"
  end

end
