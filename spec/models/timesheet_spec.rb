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
    
    it "should parse date correctly" do
      subject.date = '12/22/2011'
      subject.date.month.should eq(12)
      subject.date.day.should eq(22)
      subject.date.year.should eq(2011)
    end
  end
  
end
