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
    end
    click_button 'Sign up'

    #visit subdomain jettime.localhost.com
    #signin
  end
end
