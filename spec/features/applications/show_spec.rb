require 'rails_helper'

RSpec.describe "applications show page", type: :feature do

it "can see application info" do
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
  application.pets << tasha
   visit "/applications/#{application.id}"

   expect(page).to have_content("Name:Brett")
   expect(page).to have_content("Address:345 bur st.")
   expect(page).to have_content("City:Phoenix")
   expect(page).to have_content("State:CO")
   expect(page).to have_content("Zip:81301")
   expect(page).to have_content("Phone Number:970-677-45567")
   expect(page).to have_content("I love dogs")
   expect(page).to have_content("Jasper")
   expect(page).to have_content("Tasha")
 end

 it "can see application approve button" do # User Story 22 & 23
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
    application.pets << tasha
    visit "/applications/#{application.id}"
    within("#select-pets") do
      check "Jasper"
      check "Tasha"
    end
    click_on "Approve Selected Pets"
    expect(current_path).to eq("/pets")
    expect(page).to have_content("The selected pets have been approved.")
    visit "/pets/#{jasper.id}"
    expect(page).to have_content("Pending (On hold to #{application.name})")
    visit "/pets/#{tasha.id}"
    expect(page).to have_content("Pending (On hold to #{application.name})")
  end

  it "can only approve adoptable pets" do # User Story 24
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
     application.pets << tasha
     visit "/applications/#{application.id}"
     within("#select-pets") do
       check "Jasper"
     end
     click_on "Approve Selected Pets"
     visit "/applications/#{application.id}"
   end

   it "can see application approve button" do # User Story 25
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
      application.pets << tasha
      visit "/applications/#{application.id}"
      within("#select-pets") do
        check "Jasper"
      end
      click_on "Approve Selected Pets"
      visit "/applications/#{application.id}"
      within("#unselect-pets") do
        check "Jasper"
      end
      click_on "Unapprove Selected Pets"
      expect(current_path).to eq("/applications/#{application.id}")
      expect(page).to have_button("Approve Selected Pets")
      visit "/pets/#{jasper.id}"
      expect(page).to have_content("Status: Adoptable")
    end

end
