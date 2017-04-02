class AddDeliveryAddressToItem < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :delivery_address_id, :integer
  end
end
