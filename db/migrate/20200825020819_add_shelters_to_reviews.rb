class AddSheltersToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :shelter, foreign_key: true
  end
end
