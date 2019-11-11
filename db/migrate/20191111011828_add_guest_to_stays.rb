class AddGuestToStays < ActiveRecord::Migration[5.2]
  def change
    add_reference :stays, :guest, index: true, foreign_key: true
  end
end
