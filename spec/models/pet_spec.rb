require 'rails_helper'

describe Pet, type: :model do

    describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :approximate_age }
      it { should validate_presence_of :sex }
    end

    describe 'relationships' do
      it {should have_many :pet_applications}
      it {should have_many(:applications).through(:pet_applications)}
    end

    describe 'instance methods' do
      it "can use adoptable?" do
      shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
       jasper = shelter_1.pets.create!(name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
       expect(jasper.adoptable?).to eq(true)
    end

    it "can use pending_adoption?" do
      shelter_1 = Shelter.create( name: "Drew's Rescue",
                                address: "208 Main St.",
                                city: "Denver",
                                state: "CO",
                                zip: 80222,
                                )
       jasper = shelter_1.pets.create!(status: "Pending Adoption", name: "Jasper", approximate_age: 7, sex: "Male", image_path: "https://dogzone-tcwebsites.netdna-ssl.com/wp-content/uploads/2018/07/pomeranian-price-1.jpg")
       expect(jasper.pending_adoption?).to eq(true)
    end
  end

end
