require "features_helper"

RSpec.describe "Add a line" do
  after do
    Hierarchy::Repositories[:Line].clear
  end

  it "can create a new line" do
    visit "/lines/new"

    within "form#line-form" do
      fill_in "Name", with: "Kundapura"
      fill_in "Grade", with: "8c+"
      fill_in "Kind", with: "lead"

      click_button "Create"
    end

    expect(page).to have_current_path("/lines")
    expect(page).to have_content("Kundapura")
  end

  it "displays list of errors when params contains errors" do
    visit "/lines/new"

    within "form#line-form" do
      click_button "Create"
    end

    expect(current_path).to eq("/lines")

    expect(page).to have_content("There was a problem with your submission")
    expect(page).to have_content("Name must be filled")
    expect(page).to have_content("Grade must be filled")
  end
end
