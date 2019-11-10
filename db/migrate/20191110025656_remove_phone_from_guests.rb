class RemovePhoneFromGuests < ActiveRecord::Migration[5.2]
  def change
    remove_column :guests, :phone
  end
end
