require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see all pets attributes" do
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
    jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
    tasha = shelter_1.pets.create!(name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
    visit '/pets'
    expect(page).to have_content(tasha.name)
    expect(page).to have_content(tasha.approximate_age)
    expect(page).to have_content(tasha.sex)
    expect(page).to have_content(tasha.shelter.name)
    expect(page).to have_content(jasper.name)
    expect(page).to have_content(jasper.approximate_age)
    expect(page).to have_content(jasper.sex)
    expect(page).to have_content(jasper.shelter.name)

  end
end
