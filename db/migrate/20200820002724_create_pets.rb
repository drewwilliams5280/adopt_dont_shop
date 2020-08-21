class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :approximate_age
      t.string :sex
      t.string :image_path
    end
  end
end
