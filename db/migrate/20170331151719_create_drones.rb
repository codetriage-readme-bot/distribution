# :nodoc:
class CreateDrones < ActiveRecord::Migration[5.0]
  def change
    create_table :drones do |t|
      t.string :name

      t.timestamps
    end
  end
end
