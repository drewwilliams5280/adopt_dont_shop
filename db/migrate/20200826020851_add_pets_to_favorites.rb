class AddPetsToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :pet, foreign_key: true
  end
end
