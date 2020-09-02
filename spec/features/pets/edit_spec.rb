require 'rails_helper'

RSpec.describe "pets edit page", type: :feature do

  it "can update pet" do

    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
    jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
    tasha = shelter_1.pets.create!(name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
    visit "/pets/#{jasper.id}"
    click_on "Update Pet"
    fill_in "pet[name]", with: "Jazz"
    fill_in "pet[image_path]", with: "https://cdn3-www.dogtime.com/assets/uploads/gallery/chow-chow-dog-breed-pictures/3-fullbody.jpg"
    fill_in "pet[approximate_age]", with: "12"
    fill_in "pet[description]", with: "Best boy"
    fill_in "pet[sex]", with: "Male"
    expect(page).to have_button("Submit")
    click_on "Submit"
    expect(page).to have_content("Jazz")
  end

  it "can not allow submitted form with empty fields" do

    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
    jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
    tasha = shelter_1.pets.create!(name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
    visit "/pets/#{jasper.id}"
    click_on "Update Pet"
    fill_in "pet[name]", with: "Jazz"
    fill_in "pet[image_path]", with: "https://cdn3-www.dogtime.com/assets/uploads/gallery/chow-chow-dog-breed-pictures/3-fullbody.jpg"
    fill_in "pet[approximate_age]", with: "12"
    fill_in "pet[description]", with: ""
    fill_in "pet[sex]", with: "Male"
    click_on "Submit"
    visit "/pets/#{jasper.id}"
    # expect(page).to have_content("Enter updated information")
  end
end
