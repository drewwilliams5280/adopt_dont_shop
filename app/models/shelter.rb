class Shelter < ApplicationRecord
  has_many :pets
  has_many :reviews
  validates_presence_of :name, :address, :city, :state, :zip

  def self.sort_by_pet_count
    all.sort_by {|shelter| shelter.pets.count}.reverse
  end

  def self.sort_by_name
    all.sort_by {|shelter| shelter.name}
  end

  def pets_pending_adoption?
    self.pets.where.not(status: "Adoptable").count >= 1
  end

end
