require 'spec_helper'

describe Timesheet do
  context "factory" do
    subject { create(:timesheet) }

    it { should be_valid }
    it { subject.project.should_not be_nil }
    it { subject.user.should_not be_nil }
  end

  context "validations" do
    it "should have user and project" do
      subject.should_not be_valid
      subject.should have(1).error_on(:user_id)
      subject.should have(1).error_on(:project_id)
    end
  end
end
