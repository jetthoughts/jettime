require "spec_helper"

feature "Signing up" do
  background do
    #create(:user, :email => "miry")
  end

  scenario "Signing up with correct fields" do
    visit("/")
    click_link 'Register'
    email = Faker::Internet.email
    within("#user_new") do
      fill_in 'Name', :with => 'Monkey LTD'
      fill_in 'Domain', :with => 'jettime'
      fill_in 'Email', :with => email
      fill_in 'Password', :with =>"monkey"
      fill_in 'Re-enter Password', :with =>"monkey"
    end

    click_button 'Sign up'

    company = Company.where(name: 'Monkey LTD').first
    company.should_not be_nil
    company.owner.should_not be_nil
    company.owner.email.should == email

    page.should have_content("Email")

    #visit subdomain jettime.localhost.com
    #signin
  end
end
