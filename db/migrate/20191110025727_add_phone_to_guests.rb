class AddPhoneToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :phone, :bigint
  end
end
