require 'spec_helper'

feature "Timesheets" do

  background do
    @company = create(:company)
    @owner = create(:user, :company => @company )
    @user = create(:user, :company => @company )
    @company.owner = @owner
    @company.save!

    Array.new(3){create(:project, :company => @company)}
    Array.new(3){create(:timesheet, :user => @user)}
    
    visit(root_url(:subdomain => @company.subdomain))
    page.should have_content("Sign in")
    within("#user_new") do
      fill_in 'Email', :with => @user.email
      fill_in 'Password', :with =>"monkey"
    end
    click_button 'Login'
    click_link 'Timesheets'    
  end

  scenario "Show a list of projects" do
    page.should have_content("Daily")
    page.should have_content("Project")
  end
  
  scenario "Create a new timesheet entry" do
    click_link 'New'
    within(".form") do
      fill_in 'Date', :with => "22/12/2011"
      click_button ''
    end
    
    page.should have_content("Timesheet was successfully created")
    page.should have_content("22/12/2011")
    click_link "Timesheets"
    
    page.should have_content("22/12/2011")
  end
  
  scenario "Should not create a new timesheet entry without Hours" do
    click_link 'New'
    within(".form") do
      fill_in 'Date', :with => "22/12/2011"
      click_button ''
    end
    
    page.should have_content("Timesheet was successfully created")
  end

end
