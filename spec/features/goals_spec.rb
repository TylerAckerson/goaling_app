require 'spec_helper'
require 'rails_helper'

feature "goal creation process" do
  before(:each) do
    log_in
    visit goals_url
  end

  it "allows creation of new goals from goals index page" do
    expect(page).to have_link("Create New Goal")
  end

  it "navigates to the new goals page" do
    click_on "Create New Goal"
    expect(page).to have_content("New Goal")
  end

  it "creates a public goal" do
    click_on "Create New Goal"
    fill_in 'Goal', with: "Run a mile, fast"
    choose('Public') #this will be a radio button
    click_on "Create"

    expect(page).to have_content("Run a mile, fast")
  end

  it "creates a private goal" do
    click_on "Create New Goal"
    fill_in 'Goal', with: "Lose 10 lbs"
    choose('Private') #this will be a radio button
    click_on "Create"

    expect(page).to have_content("Lose 10 lbs")
  end
end

feature "goal update process" do
  before(:each) do
    log_in
    visit goals_url

    click_on "Create New Goal"
    fill_in 'Goal', with: "Win the lottery"
    choose('Private') #this will be a radio button
    click_on "Create"
  end

  it "allows updating of goals from the goals  index" do
    expect(page).to have_button("Update")
  end

  it "navigates to the goal edit page" do
    click_on "Update"
    expect(page).to have_content("Edit Goal")
  end

  it "updates the goal" do
    click_on "Update"
    fill_in 'Goal', with: "Go to space (weigh 0 lbs)"
    choose('Public')
    click_on "Update"
    expect(page).to have_content("Go to space (weigh 0 lbs)")
  end

  it "creates a private goal" do
    click_on "Create New Goal"
    fill_in 'Goal', with: "Lose 10 lbs"
    choose('Private') #this will be a radio button
    click_on "Create"

    expect(page).to have_content("Lose 10 lbs")
  end
end
