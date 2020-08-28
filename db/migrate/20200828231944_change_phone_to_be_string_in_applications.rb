class ChangePhoneToBeStringInApplications < ActiveRecord::Migration[5.2]
  def change
  change_column :applications, :phone_number, :string
 end
end
