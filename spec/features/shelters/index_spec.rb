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

  it "removes delete shelter button when pets are pending adoption" do # User Story 26
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                              address: "208 Main St.",
                              city: "Denver",
                              state: "CO",
                              zip: 80222,
                              )
     jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
     tasha = shelter_1.pets.create!(name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
     application = Application.create!(name: "Brett", address: "345 bur st.", city: "Phoenix", state: "CO", zip: 81301, phone_number: "970-677-45567", description: "I love dogs" )
     application.pets << jasper
     visit "/applications/#{application.id}"
     within("#select-pets") do
       check "Jasper"
     end
     click_on "Approve Selected Pets"
     visit "/shelters"
     expect(page).to_not have_link("Delete Shelter")
     visit "/shelters/#{shelter_1.id}"
     expect(page).to_not have_link("Delete Shelter")
   end

   it "removes delete shelter button when pets are pending adoption" do # User Story 27
     shelter_1 = Shelter.create( name: "Drew's Rescue",
                               address: "208 Main St.",
                               city: "Denver",
                               state: "CO",
                               zip: 80222,
                               )
      jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
      review = shelter_1.reviews.create!(title: "Terrible Service",
                                rating: "2",
                                content: "Manager was very rude and slapped a kitten!",
                                picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                                )
      visit "/shelters"
      click_on "Delete"
      expect(page).to_not have_content(shelter_1.name)
    end

end
