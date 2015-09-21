require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do

    before(:each) do
      visit new_user_url
      fill_in 'Username', with: "testing_username"
      fill_in "Password", with: "biscuits"
      click_on "Create User"
    end

    it "shows username on the homepage after signup" do
      expect(page).to have_content "testing_username"
    end

    it "redirects to goals index page after signup" do
      expect(page).to have_content "Goals"
    end
  end
end

feature "logging in" do
  before(:each) do
    user = create(:user)
  end

  it "shows username on the homepage after login" do
    expect(page).to have_content user.username
  end

end

feature "logging out" do

  it "begins with logged out state" do
    expect(page).to have_content "Log In"
  end

  it "doesn't show username on the homepage after logout" do
    expect(page).should_not have_selector(:link_or_button, 'Sign Out')
  end

end
