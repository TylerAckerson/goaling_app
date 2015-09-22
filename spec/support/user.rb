def log_in
  create(:user)
  visit new_session_url
  fill_in 'Username', with: "example_username"
  fill_in "Password", with: "password123"
  click_button "Sign In"
end
