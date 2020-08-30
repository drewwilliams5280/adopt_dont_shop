require 'rails_helper'

RSpec.describe "favorites adopt page", type: :feature do

 it "show form for adopting favorite pets" do #User Story 16
   shelter_1 = Shelter.create( name: "Drew's Rescue",
                               address: "208 Main St.",
                               city: "Denver",
                               state: "CO",
                               zip: 80222,
                               )
   jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
   tasha = shelter_1.pets.create!(status: "Pending Adoption", name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
   visit "/pets/#{jasper.id}"
   click_on "Add to Favorites"
   visit "/pets/#{tasha.id}"
   click_on "Add to Favorites"
   visit "/favorites"
   click_on "Adopt Favorite Pets"
   expect(current_path).to eq("/favorites/adopt")
   expect(page).to have_content("Jasper")
   expect(page).to have_content("Tasha")
   expect(page).to have_content("Name:")
   expect(page).to have_content("Address:")
   expect(page).to have_content("City:")
   expect(page).to have_content("State Abbreviation:")
   expect(page).to have_content("Zip Code:")
   expect(page).to have_content("Phone Number:")
   expect(page).to have_content("Describe why you would make a good home for this/these pets")
   fill_in 'name[name]', with: Faker::Name.name
   fill_in "address[address]", with: Faker::Address.street_address
   fill_in "city[city]", with: Faker::Address.city
   fill_in "state[state]", with: Faker::Address.state_abbr
   fill_in "zip[zip]", with: 80000
   fill_in "phone_number[phone_number]", with: Faker::PhoneNumber.cell_phone
   fill_in "description[description]", with: Faker::Hipster.sentence
   check 'Jasper'
   check 'Tasha'
   click_on "Submit Application"
   expect(page).to have_content("Your application went through for the pets that were selected.")
   expect(current_path).to eq('/favorites')
   within("#favorites")do
   expect(page).to_not have_content("Jasper")
   expect(page).to_not have_content("Tasha")
 end
end

 it "show form for adopting favorite pets" do #User Story 17
   shelter_1 = Shelter.create( name: "Drew's Rescue",
                               address: "208 Main St.",
                               city: "Denver",
                               state: "CO",
                               zip: 80222,
                               )
   jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
   tasha = shelter_1.pets.create!(status: "Pending Adoption", name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
   visit "/pets/#{jasper.id}"
   click_on "Add to Favorites"
   visit "/pets/#{tasha.id}"
   click_on "Add to Favorites"
   visit "/favorites"
   click_on "Adopt Favorite Pets"
   fill_in 'name[name]', with: Faker::Name.name
   fill_in "address[address]", with: Faker::Address.street_address
   fill_in "city[city]", with: Faker::Address.city
   fill_in "state[state]", with: Faker::Address.state_abbr
   fill_in "phone_number[phone_number]", with: Faker::PhoneNumber.cell_phone
   fill_in "description[description]", with: Faker::Hipster.sentence
   check 'Jasper'
   check 'Tasha'
   click_on "Submit Application"
   expect(page).to have_content("You must fill in all fields in order to submit application.")
 end




it "can see all pet applications" do
   shelter_1 = Shelter.create( name: "Drew's Rescue",
                               address: "208 Main St.",
                               city: "Denver",
                               state: "CO",
                               zip: 80222,
                               )
   jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
   tasha = shelter_1.pets.create!(name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
   application = Application.create!(name: "Brett", address: "345 bur st.", city: "Phoenix", state: "CO", zip: 81301, phone_number: "970-677-45567", description: "I love dogs" )
   visit "/pets/#{jasper.id}"
   click_on "Add to Favorites"
  visit "/favorites"
  click_on "Adopt Favorite Pets"
  fill_in 'name[name]', with: Faker::Name.name
  fill_in "address[address]", with: Faker::Address.street_address
  fill_in "city[city]", with: Faker::Address.city
  fill_in "state[state]", with: Faker::Address.state_abbr
  fill_in "zip[zip]", with: "57789"
  fill_in "phone_number[phone_number]", with: Faker::PhoneNumber.cell_phone
  fill_in "description[description]", with: Faker::Hipster.sentence
  check 'Jasper'
  click_on "Submit Application"
  within("#favorites_right_nav") do
    click_on "Jasper"
  end
  # save_and_open_page
  expect(page).to have_content("Jasper")
  expect(page).to have_content("7")
  expect(page).to have_content("Male")
end
end
