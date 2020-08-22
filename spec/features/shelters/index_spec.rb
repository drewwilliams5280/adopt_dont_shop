require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see all shelters names" do
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
    shelter_2 = Shelter.create( name: "Happy Paws",
                                address: "444 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it "has a New Shelter link" do
    visit "/shelters"

    expect(page).to have_link("New Shelter")
  end

  it "can update shelter from shelter index page" do #User Story 13
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
    shelter_2 = Shelter.create( name: "Happy Paws",
                                address: "444 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )
    visit "/shelters"
    expect(page).to have_link('Edit', count: Shelter.all.count)
    first(:link, "Edit").click
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
  end

  it "can delete shelter from index page" do #User story 14

    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
    shelter_2 = Shelter.create( name: "Happy Paws",
                                address: "444 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )
    visit "/shelters"
    expect(page).to have_link('Delete', count: Shelter.all.count)
    first(:link, "Delete").click
    expect(current_path).to eq("/shelters")
    expect(page).to_not have_content("Drew's Rescue")

  end

end
