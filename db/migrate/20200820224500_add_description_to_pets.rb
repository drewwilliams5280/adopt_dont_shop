class AddDescriptionToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :description, :string, default: "A loving animal looking for its forever home."
  end
end
