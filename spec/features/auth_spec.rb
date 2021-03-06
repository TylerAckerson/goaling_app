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
      fill_in 'Username', with: "testing_username1"
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
    create(:user)
    visit new_session_url
    fill_in 'Username', with: "example_username"
    fill_in "Password", with: "password123"
    click_button "Sign In"
  end

  it "shows username on the homepage after login" do
    expect(page).to have_content "example_username"
  end

end

feature "logging out" do
  before(:each) do
    visit goals_url
  end

  it "begins with logged out state" do
    expect(page).to have_content "Log In"
    expect(page).not_to have_content "Sign Out"
  end

  it "doesn't show username on the homepage after logout" do
    expect(page).not_to have_selector(:link_or_button, 'Sign Out')
  end

end
