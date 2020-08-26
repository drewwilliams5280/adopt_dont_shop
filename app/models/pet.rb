class Pet < ApplicationRecord
  has_many :favorites
  belongs_to :shelter
  validates_presence_of :name, :approximate_age, :sex, :image_path
end
