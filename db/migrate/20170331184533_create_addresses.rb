# :nodoc:
class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :street_name
      t.integer :building_number
      t.integer :zip
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
