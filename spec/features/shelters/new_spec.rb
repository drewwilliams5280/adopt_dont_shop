require 'rails_helper'

RSpec.describe "shelters new page", type: :feature do

  it "can navigate to New Shelter page" do

    visit "/shelters"
    click_on "New Shelter"
    expect(page).to have_content("Enter a new shelter:")
    expect(page).to have_button("Create Shelter")

  end

  it "can fill out new shelter form" do

    visit "/shelters/new"
    fill_in "shelter[name]", with: "Best Friends"
    fill_in "shelter[address]", with: "4500 3rd Ave."
    fill_in "shelter[city]", with: "Denver"
    fill_in "shelter[state]", with: "CO"
    fill_in "shelter[zip]", with: "84544"
    click_button "Create Shelter"
    expect(page).to have_content("Best Friends")

  end

  it "can give flash message when form isn't completed" do

    visit "/shelters/new"
    fill_in "shelter[name]", with: "Best Friends"
    fill_in "shelter[address]", with: "4500 3rd Ave."
    fill_in "shelter[city]", with: ""
    fill_in "shelter[state]", with: "CO"
    fill_in "shelter[zip]", with: "84544"
    click_button "Create Shelter"
    expect(page).to have_content("Please fill in the city field.")

  end

end
