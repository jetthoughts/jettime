require "spec_helper"

feature "Admin Signing In" do
  background(:all) do
    @company = create(:company, subdomain: "admin")
    @admin   = create(:admin, company: @company)
  end

  scenario "Signing in with correct fields" do
    visit(new_user_session_url(host: @company.domain))

    page.should have_content("Sign in")
    within("form") do
      fill_in 'Email', :with => @admin.email
      fill_in 'Password', :with =>"monkey"
    end

    click_button 'Login'

    page.should have_content("Admin Panel")
    page.should have_content("Signed in successfully.")
  end

  scenario "without correct fields" do
    visit(new_user_session_url(host: @company.domain))
    page.should have_content("Sign in")
    within("form") do
      fill_in 'Email', :with => 'monkey_incorrect@mailinator.com'
      fill_in 'Password', :with =>"monkeyinvalid"
    end

    click_button 'Login'

    page.should have_content("Invalid email or password.")
  end

end
