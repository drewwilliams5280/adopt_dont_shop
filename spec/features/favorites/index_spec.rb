require 'rails_helper'

RSpec.describe "favorites index page", type: :feature do

  it "can see favorite pets and click favorite indicator link" do

    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
    jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
    tasha = shelter_1.pets.create!(status: "Pending Adoption", name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
    blitzen = shelter_1.pets.create!(name: "Blitzen", approximate_age: 7, sex: "Male", image_path: "https://vetstreet.brightspotcdn.com/dims4/default/f278f8d/2147483647/crop/0x0%2B0%2B0/resize/645x380/quality/90/?url=https%3A%2F%2Fvetstreet-brightspot.s3.amazonaws.com%2F4f%2F7556b09ea411e0a2380050568d634f%2Ffile%2FDachshund-5-645mk062311.jpg")
    rudolph = shelter_1.pets.create!(name: "Rudolph", approximate_age: 8, sex: "Male", image_path: "https://arc-anglerfish-arc2-prod-bostonglobe.s3.amazonaws.com/public/OKPXEIHXFYI6REFQ7BHTHPSTBU.jpg")
    blue_steel = shelter_1.pets.create!(name: "Blue Steel", approximate_age: 1, sex: "Male", image_path: "https://www.veredoptical.com/wp/wp-content/uploads/2013/04/DogGlasses.jpg")
    visit "/pets/#{blitzen.id}"
    click_on "Favorite Pet"
    visit "/pets/#{rudolph.id}"
    click_on "Favorite Pet"
    visit "/favorites"
    expect(page).to have_content("Blitzen")
    expect(page).to have_content("Rudolph")
    expect(page).to have_xpath("//img[@src='#{blitzen.image_path}']")
    expect(page).to have_xpath("//img[@src='#{rudolph.image_path}']")
    click_on "Blitzen"
    expect(current_path).to eq("/pets/#{blitzen.id}")
 end

end
