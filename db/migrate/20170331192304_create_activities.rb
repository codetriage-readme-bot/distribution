# :nodoc:
class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.references :drone, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :progress, default: 0

      t.timestamps
    end
  end
end
