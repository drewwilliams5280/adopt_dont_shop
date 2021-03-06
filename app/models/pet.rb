class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications
  has_many :applications, through: :pet_applications
  validates_presence_of :name, :approximate_age, :sex, :image_path

  def adoptable?
    self.status == "Adoptable"
  end

  def pending_adoption?
    self.status.include?("Pending")
  end

end
