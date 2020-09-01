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

  it "can see link to edit review and edit that review" do #User Story 5

    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "1300 Willow St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )
    review_1 = shelter_1.reviews.create!(title: "Terrible Service",
                              rating: "2",
                              content: "Manager was very rude and slapped a kitten!",
                              picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                              )
    visit "/shelters/#{shelter_1.id}"
    click_on "Edit Review"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/#{review_1.id}/edit")
    expect(page).to have_field(:title, with: "#{review_1.title}")
    fill_in :rating, with: "5"
    fill_in :content, with: "This place rocks!"
    fill_in :title, with: "Changed my mind!"
    # fill_in :picture, with: "https://lh3.googleusercontent.com/proxy/M0EPbDwsZdDe2dZ4-7Gs9CvpLMgMR65WNr6PIQRBKe4TCdwjLO3Kk1VwHMQnx4CS8ogurhRtTqYOZRoHkNGlO28Iz_hmHgfwcx2LqrTfOidGZ8mMVw"
    expect(page).to have_button("Submit")
    click_on "Submit"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")

  end

  it "can give flash message when review fields aren't filled in" do #User Story 6
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "1300 Willow St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )
    review_1 = shelter_1.reviews.create!(title: "Terrible Service",
                              rating: "2",
                              content: "Manager was very rude and slapped a kitten!",
                              picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                              )


    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_link("Edit Review")
    click_on "Edit Review"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/#{review_1.id}/edit")
    fill_in :rating, with: ""
    fill_in :content, with: "This place sucks!"
    fill_in :picture, with: "https://lh3.googleusercontent.com/proxy/M0EPbDwsZdDe2dZ4-7Gs9CvpLMgMR65WNr6PIQRBKe4TCdwjLO3Kk1VwHMQnx4CS8ogurhRtTqYOZRoHkNGlO28Iz_hmHgfwcx2LqrTfOidGZ8mMVw"
    click_on "Submit"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/#{review_1.id}/edit")
    expect(page).to have_content("Please fill in Title, Rating, and Review sections")

  end

  it "can delete a review" do #User Story 7
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "1300 Willow St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80220,
                                )
    review_1 = shelter_1.reviews.create!(title: "Terrible Service",
                              rating: "2",
                              content: "Manager was very rude and slapped a kitten!",
                              picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                              )
    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_link("Delete Review")
    click_on "Delete Review"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
    expect(page).to_not have_content('Terrible Service')
  end

  it "can display stats" do #User Story 30
    shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
    jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
    tasha = shelter_1.pets.create!(name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
    application = Application.create!(name: "Brett", address: "345 bur st.", city: "Phoenix", state: "CO", zip: 81301, phone_number: "970-677-45567", description: "I love dogs" )
    review1 = shelter_1.reviews.create!(title: "Terrible Service",
                              rating: "2",
                              content: "Manager was very rude and slapped a kitten!",
                              picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                              )
    review2 = shelter_1.reviews.create!(title: "Terrible Service",
                           rating: "4",
                           content: "Manager was very rude and slapped a kitten!",
                           picture: "https://www.catster.com/wp-content/uploads/2017/12/Sad-young-brown-tabby-kitten.jpg"
                           )
    application.pets << jasper
    application.pets << tasha
    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content("Number of Pets: 2")
    expect(page).to have_content("Average Rating: 3.0")
    expect(page).to have_content("Number of Pet Applications: 2")
  end
end
