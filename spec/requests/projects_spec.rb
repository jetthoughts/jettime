require 'spec_helper'

feature "Account Projects" do

  background do
    @company = create(:company)
    @user = create(:user, :email => "monkey@mailinator.com", :company => @company )
    @company.owner = @user
    @company.save!

    Array.new(3){create(:project, :company => @company)}
  end

  scenario "Show a list of projects" do
    visit(root_url(:subdomain => @company.subdomain))
    page.should have_content("Sign in")
    within("#user_new") do
      fill_in 'Email', :with => 'monkey@mailinator.com'
      fill_in 'Password', :with =>"monkey"
    end
    click_button 'Login'

    click_link 'Projects'
    page.should have_content("Created at")
  end

end
