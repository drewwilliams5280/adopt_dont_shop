class Shelter < ApplicationRecord
  has_many :pets
  has_many :reviews
  validates_presence_of :name, :address, :city, :state, :zip

  def pets_pending_adoption?
    self.pets.where.not(status: "Adoptable").count >= 1
  end

  def pet_count
    self.pets.count
  end

  def average_rating
    self.reviews.average(:rating).to_f
  end

  def application_count
    pet_ids = self.pets.ids
    PetApplication.where('pet_id IN (?)', pet_ids).count
  end

end
