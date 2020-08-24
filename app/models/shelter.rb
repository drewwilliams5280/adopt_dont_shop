class Shelter < ApplicationRecord
  has_many :pets
  validates_presence_of :name, :address, :city, :state, :zip

  def self.sort_by_pet_count
    all.sort_by {|shelter| shelter.pets.count}.reverse
  end

  def self.sort_by_name
    all.sort_by {|shelter| shelter.name}
  end

end
