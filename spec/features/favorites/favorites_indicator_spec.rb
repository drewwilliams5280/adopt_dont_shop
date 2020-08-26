require 'rails_helper'

RSpec.describe "favorites indicator", type: :feature do
  it "can see a favorites indicator" do
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
    jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
    visit "/pets/#{jasper.id}"
    click_on "Favorite Pet"
    visit "/shelters"
    expect(page).to have_link("Favorites: #{Favorite.all.count}")
    click_on "Favorites: 1"
    expect(current_path).to eq("/favorites")

end
end
