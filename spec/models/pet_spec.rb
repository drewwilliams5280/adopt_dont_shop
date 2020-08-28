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

end
