require 'spec_helper'

describe Company do
  context "factory" do
    subject { create(:company) }

    it { should be_valid }
    it { subject.name.should_not be_blank }
  end

  context "validates" do
    it { should_not be_valid }
    it { should have(1).error_on(:name) }
    it { should have(1).error_on(:subdomain) }
    it "uniqueness of subdomain" do
      subdomain = Faker::Internet.domain_word
      create(:company, :subdomain => subdomain)
      company = build(:company, :subdomain => subdomain)
      company.should_not be_valid
      company.should have(1).error_on(:subdomain)
    end
  end

  context "owner" do
    subject { create(:company) }

    it "should have owner" do
      subject.owner = create(:user)
      subject.owner.should_not be_nil
    end

  end

  context "domain" do

    subject { create(:company) }

    it "should show full domain" do
      subject.domain.should eq(subject.subdomain + "." + Rails.application.config.domain)
    end

  end

  context "heroku subdomain" do

    subject { create(:company) }

    @focus
    it "should create a heroku app" do
      -> {
        subject
      }.should change { HerokuSubdomain::App.all.size }.by 1
    end

  end
end
