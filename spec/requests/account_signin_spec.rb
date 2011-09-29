require "spec_helper"

feature "Account Signing in" do
  background do
    @company = create(:company)
    @user = create(:user, :email => "monkey@mailinator.com", :company => @company )
    @company.owner = @user
    @company.save!
  end

  scenario "Signing up with correct fields" do
    visit(account_root_url(:host => @company.domain))

    page.should have_content("Sign in")
    within("#user_new") do
      fill_in 'Email', :with => 'monkey@mailinator.com'
      fill_in 'Password', :with =>"monkey"
    end

    click_button 'Login'

    page.should have_content("Dashboard")
    page.should have_content("Signed in successfully.")
  end
end
