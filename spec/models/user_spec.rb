require 'spec_helper'

describe User do
  context "factory" do
    subject { create(:user) }

    it { should be_valid }
  end

  context "validations" do
    it { should_not be_valid }
    it { should have(2).error_on(:email) }
    it { should have(1).error_on(:password) }
    it { should have(1).error_on(:company) }
  end

  context "company" do
    subject { create(:user) }
    it { should respond_to(:company) }
    it "should create via nested attributes" do
      user = create(:user, {:company_attributes => {}})
      user.company.should_not be_new_record
    end

    it "should build an company" do
      user    = build(:user, :company => nil)
      company = user.build_company(attributes_for(:company))
      user.company.should_not be_nil
      user.save!
      user = User.find(user.id)
      user.company.should_not be_nil
    end

    it "should find user by subdomain and email" do
      company = create(:company)
      email = Faker::Internet.email
      user = create(:user, :email => email, :company => company )
      company.users.first.should == user
    end
  end
  
  context "timesheets" do
    subject { create(:user) }
    
    it { should respond_to(:timesheets) }
  end

  describe ".find_for_authentication" do
  end

  context "role" do

    context "admin" do
      subject { create(:admin) }

      it { should be_admin }
    end

    context "user" do
      subject { create(:user) }

      it { should_not be_admin }
    end
  end
end
