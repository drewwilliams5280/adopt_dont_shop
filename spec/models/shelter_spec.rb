require 'rails_helper'

describe Shelter, type: :model do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
    it { should validate_presence_of :city }
    it { should validate_presence_of :state }
    it { should validate_presence_of :zip }
  end

  describe 'relationships' do
  it { should have_many :pets }
end

  describe 'instance methods' do
    it "can tell if pet are pending adoption" do
      shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
       jasper = shelter_1.pets.create!(status: "Pending", name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
       expect(shelter_1.pets_pending_adoption?).to eq(true)
    end

    it "can get average review rating" do
      shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
       jasper = shelter_1.pets.create!(status: "Pending", name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
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

       expect(shelter_1.average_rating).to eq(3.0)
    end

    it "can get pet count" do
      shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
       jasper = shelter_1.pets.create!(status: "Pending", name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")

       expect(shelter_1.pet_count).to eq(1)
    end

    it "can get applications count" do
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
      expect(shelter_1.application_count).to eq(2)
    end

    it "can sort by number of pets" do
      shelter_1 = Shelter.create( name: "Drew's Rescue",
                                  address: "208 Main St.",
                                  city: "Denver",
                                  state: "CO",
                                  zip: 80222,
                                  )
      shelter_2 = Shelter.create( name: "Happy Paws",
                                 address: "222 22nd Ave.",
                                 city: "Denver",
                                 state: "CO",
                                 zip: 82222,
                                 )
      jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
      tasha = shelter_1.pets.create!(name: "Tasha", approximate_age: 4, sex: "Female", image_path: "https://www.thesprucepets.com/thmb/ma-SKxXBI5uvv_H0McPOhfCZajU=/1415x1415/smart/filters:no_upscale()/DobermanPinscher-GettyImages-947977330-4309781e940842368e71ef744caa4f9c.jpg")
      prince = shelter_2.pets.create!(name: "Prince", approximate_age: 7, sex: "Male", image_path: "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/article_thumbnails/other/dog_cool_summer_slideshow/1800x1200_dog_cool_summer_other.jpg")
      sorted_shelters = Shelter.sort_by_pet_count
      expect(sorted_shelters).to eq([shelter_1, shelter_2])
    end


  end

end
