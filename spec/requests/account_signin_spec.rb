require "spec_helper"

feature "Account Signing in" do
  background do
    @company = create(:company)
    @user = create(:user, :email => "monkey@mailinator.com", :company => @company )
    @company.owner = @user
    @company.save!

    @company_ext = create(:company)
    @user_ext = create(:user, :email => "monkey1@mailinator.com", :company => @company_ext )
    @company_ext.owner = @user_ext
    @company_ext.save!
  end

  scenario "Signing in with correct fields" do
    visit(account_root_url(:subdomain => @company.subdomain))

    page.should have_content("Sign in")
    within("#user_new") do
      fill_in 'Email', :with => 'monkey@mailinator.com'
      fill_in 'Password', :with =>"monkey"
    end

    click_button 'Login'

    page.should have_content("Dashboard")
    page.should have_content("Signed in successfully.")
  end

  scenario "without correct fields" do
    visit(account_root_url(:host => @company.domain))
    page.should have_content("Sign in")
    within("#user_new") do
      fill_in 'Email', :with => 'monkey_incorrect@mailinator.com'
      fill_in 'Password', :with =>"monkeyinvalid"
    end

    click_button 'Login'

    page.should have_content("Invalid email or password.")
  end

  scenario "Signin correct fields for different company" do
    visit(account_root_url(:host => @company_ext.domain))

    page.should have_content("Sign in")
    within("#user_new") do
      fill_in 'Email', :with => 'monkey@mailinator.com'
      fill_in 'Password', :with =>"monkey"
    end

    click_button 'Login'

    page.should have_content("Invalid email or password.")
  end

  scenario "Signin for not existen company" do
    visit(account_root_url(:host => "not.exists.org"))
    page.should have_content("Register")
  end

end
