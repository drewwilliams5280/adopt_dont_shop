class Review < ApplicationRecord
  belongs_to :shelter
  validates_presence_of :title, :content, :picture, :rating
end
