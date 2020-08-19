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
  
end
