class CreateStays < ActiveRecord::Migration[5.2]
  def change
    create_table :stays do |t|
      t.integer :cost
      t.string :title
      t.string :location
      t.string :type
      t.integer :number_of_guests
      t.integer :bedrooms
      t.integer :baths
      t.text :amenities
      t.text :about

      t.timestamps
    end
  end
end
