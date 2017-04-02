# Access drone helper method
module DroneHelper
  def command_center_address(_item)
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
    available = [:picked, :reached, :arrived].any? { |es| es == status.to_sym }
    if available
      mapper = { picked: :item, reached: :delivery, arrived: :command_center }[status.to_sym]
      send("#{mapper}_address".to_sym, item)
    end
  end

  def box_list(active, status, &block)
    if active
      link_to drone_update_activity_path(id: @drone.id, message: status.to_s), method: :post, remote: true, &block
    else
      link_to '#', &block
    end
  end

  def status_message(name)
    ::AppUtil.get_progress_text(name)
  end
end
