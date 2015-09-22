require 'spec_helper'
require 'rails_helper'

feature "the user page" do
  before(:each) do
    visit new_session_url
    fill_in 'Username', with: "tyler5"
    fill_in "Password", with: "password"
    click_button "Sign In"
    visit "/users/1"
  end

  it "has the user's name" do
    save_and_open_page
    expect(page).to have_content User.first.username
  end

  it "shows the users goals" do
    expect(page).to have_content "Goals for #{User.find(1).username}"
  end

  it "shows user-level comments" do
    expect(page).to have_content "Comments for #{User.find(1).username}"
  end
end
