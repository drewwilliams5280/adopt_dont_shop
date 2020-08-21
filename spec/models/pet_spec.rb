require 'rails_helper'

describe Pet, type: :model do

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :approximate_age }
    it { should validate_presence_of :sex }
  end

end
