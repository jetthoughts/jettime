require 'spec_helper'

feature "Timesheets" do

  background do
    @company = create(:company)
    @owner = create(:user, :company => @company )
    @user = create(:user, :company => @company )
    @company.owner = @owner
    @company.save!

    @projects = Array.new(3){create(:project, :company => @company)}
    @timesheets = Array.new(3){create(:timesheet, user: @user, project: @projects.first)}
    
    visit(root_url(:subdomain => @company.subdomain))
    page.should have_content("Sign in")
    within("form") do
      fill_in 'Email', :with => @user.email
      fill_in 'Password', :with =>"monkey"
    end
    click_button 'Login'
    click_link 'Timesheets'    
  end

  scenario "Show a list of timesheets" do
    page.should have_content("Daily")
    page.should have_content("Project")
  end
  
  scenario "Create a new timesheet entry" do
    click_link 'New'
    notes = Faker::Lorem.sentence
    within(".form") do
      fill_in 'Date', :with => "22/12/2011"
      fill_in 'Hours', :with => 1
      fill_in 'Notes', :with => notes
      click_button ''
    end
    
    page.should have_content("Timesheet was successfully created")
    page.should have_content("12/22/2011")
    click_link "Timesheets"
    
    page.should have_content("12/22/2011")
    page.should have_content(notes)
  end
  
  scenario "Should not create a new timesheet entry without Hours, Date, Notes" do
    click_link 'New'
    within(".form") do
      click_button ''
    end
    
    page.should have_content("Hours can't be blank")
    page.should have_content("Date can't be blank")
    page.should have_content("Notes can't be blank")
  end
  
  scenario "Should have ability to edit timesheet" do
    timesheet = @timesheets.first
    visit(edit_timesheet_url(timesheet.id, subdomain: @company.subdomain))
    page.should have_field("Notes", :with => timesheet.notes)
    
    within("form") do
      fill_in "Notes", :with => "New notes for the timesheet"
      click_button ''
    end
    page.should have_content("Timesheet was successfully updated.")
    page.should have_content("New notes for the timesheet")
  end

end
