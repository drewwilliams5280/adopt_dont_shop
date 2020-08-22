require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do

  it "can navigate to a shelter's page" do
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "1300 Willow St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )
    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content("Drew's Rescue")
    expect(page).to have_content("1300 Willow")
    expect(page).to have_content("Denver")
    expect(page).to have_content(80220)
  end

  it "has a link to Update Shelter" do
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "1300 Willow St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                              )
    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_link("Update Shelter")
    click_on "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
  end


  it "has a link to Delete Shelter" do
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "1300 Willow St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )
    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_link("Delete Shelter")
    click_on "Delete Shelter"
    expect(current_path).to eq('/shelters')
    expect(Shelter.count).to eq(0)
  end

end
