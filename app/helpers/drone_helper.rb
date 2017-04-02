# Access drone helper method
module DroneHelper
  def commend_center_address item
    address = Address.command_center
    render 'shared/address', address: address
  end

  def item_address(item)
    address = item.address
    render 'shared/address', address: address
  end

  def delivery_address(item)
    address = item.delivery_address
    render 'shared/address', address: address
  end

  def display_address(status, item)
    available = [:picked, :reached, :arrived].any?{|es| es == status.to_sym }
    p available
    if available
      mapper = {picked: :item, reached: :delivery, arrived: :command_center}[status.to_sym]
      send("#{mapper}_address".to_sym, item)
    end
  end
end
