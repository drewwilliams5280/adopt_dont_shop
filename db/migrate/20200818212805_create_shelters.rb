class CreateShelters < ActiveRecord::Migration[5.2]
  def change
    create_table :shelters do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
    end
  end
end
