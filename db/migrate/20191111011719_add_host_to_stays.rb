class AddHostToStays < ActiveRecord::Migration[5.2]
  def change
    add_reference :stays, :host, index: true, foreign_key: true 
  end
end
