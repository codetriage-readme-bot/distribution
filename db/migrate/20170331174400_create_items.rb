# :nodoc:
class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :weight
      t.integer :priority
      t.integer :status, default: 0
      t.integer :address_id

      t.timestamps
    end
  end
end
