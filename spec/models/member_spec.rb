require 'spec_helper'

describe Member do

  context "factory" do
    subject {create(:member)}

    it {should be_valid}
  end

  it "should able to create" do
    company = create(:company)
    user = create(:user, :company => company)
    project = create(:project, :company => company)

    member = Member.new :project_id => project.id, :user_id => user.id
    member.should be_valid
  end
end