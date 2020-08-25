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

  it "can see all reviews" do #User Story 2

    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "1300 Willow St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )
    shelter_1.reviews.create!(title: "Terrible Service",
                              rating: "2",
                              content: "Manager was very rude and slapped a kitten!",
                              picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                              )


    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content("Review")

  end

  it "can make new reviews" do #User Story 3
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "1300 Willow St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )
    shelter_1.reviews.create!(title: "Terrible Service",
                              rating: "2",
                              content: "Manager was very rude and slapped a kitten!",
                              picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                              )


    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_link("New Review")
    click_on "New Review"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/review")
    expect(page).to have_content("Title")
    expect(page).to have_content("Rating")
    expect(page).to have_content("Review")
    expect(page).to have_button("Create Review")
    fill_in :title, with: "Boo"
    fill_in :rating, with: "1"
    fill_in :content, with: "This place sucks!"
    fill_in :picture, with: "https://lh3.googleusercontent.com/proxy/M0EPbDwsZdDe2dZ4-7Gs9CvpLMgMR65WNr6PIQRBKe4TCdwjLO3Kk1VwHMQnx4CS8ogurhRtTqYOZRoHkNGlO28Iz_hmHgfwcx2LqrTfOidGZ8mMVw"
    click_on "Create Review"
  end

  it "can give flash message when fields aren't filled in" do #User Story 4
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "1300 Willow St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )
    shelter_1.reviews.create!(title: "Terrible Service",
                              rating: "2",
                              content: "Manager was very rude and slapped a kitten!",
                              picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                              )


    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_link("New Review")
    click_on "New Review"
    fill_in :rating, with: "1"
    fill_in :content, with: "This place sucks!"
    fill_in :picture, with: "https://lh3.googleusercontent.com/proxy/M0EPbDwsZdDe2dZ4-7Gs9CvpLMgMR65WNr6PIQRBKe4TCdwjLO3Kk1VwHMQnx4CS8ogurhRtTqYOZRoHkNGlO28Iz_hmHgfwcx2LqrTfOidGZ8mMVw"
    click_on "Create Review"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/review")
    expect(page).to have_content("Please fill in Title, Rating, and Review sections")

  end

end
