require "spec_helper"

feature "Signing up" do
  background do
    #create(:user, :email => "miry")
  end

  scenario "Signing up with correct fields" do
    visit("/")
    click_link 'Register'

    within("#user_new") do
      fill_in 'Name', :with => 'Monkey LTD'
      fill_in 'Domain', :with => 'jettime'
      fill_in 'Email', :with => 'monkey@mailinator.com'
      fill_in 'Password', :with =>"monkey"
      fill_in 'Re-enter Password', :with =>"monkey"
    end

    click_button 'Sign up'

    Company.where(name: 'Monkey LTD').first.should_not be_nil

    page.should have_content("Email")

    #visit subdomain jettime.localhost.com
    #signin
  end
end
