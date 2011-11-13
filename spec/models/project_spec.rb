require 'spec_helper'

describe Project do

  before(:all) do
    @user = create(:user)
  end

  context "factory" do
    subject { create(:project) }

    it { should be_valid }
  end

  context "associations" do
    subject { create(:project) }

    context "members" do
      it { should respond_to(:members) }
      it "should ability to add new user to members" do
        -> {
          subject.members.create(attributes_for(:member, :user_id => @user.id)).should be_valid
        }.should change { subject.members(true).count }.by(1)
      end

      it "should return users" do
        user = create(:user)
        subject.members.create(attributes_for(:member, :user_id => user.id))
        subject.user_ids.should have(1).item
        subject.users.entries.should include(user)
      end

    end
  end
end
