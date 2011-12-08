require 'spec_helper'

feature "Account Timesheets" do

  background do
    @company = create(:company)
    @owner = create(:user, :email => "monkey@mailinator.com", :company => @company )
    @user = create(:user, :email => "monkey1@mailinator.com", :company => @company )
    @company.owner = @owner
    @company.save!

    Array.new(3){create(:project, :company => @company)}
  end

  scenario "Show a list of projects" do
    visit(root_url(:subdomain => @company.subdomain))
    page.should have_content("Sign in")
    within("#user_new") do
      fill_in 'Email', :with => 'monkey1@mailinator.com'
      fill_in 'Password', :with =>"monkey"
    end
    click_button 'Login'

    click_link 'Timesheets'
    pending
    # page.should have_content("Daily")
  end

end
