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
  end

end
