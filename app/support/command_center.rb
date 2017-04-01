# CommandCenter do monitor and send
# instruction to drone deliver goods to right destinations
class CommandCenter
  attr_reader :drone, :last_activity
  delegate :id, to: :drone

  def initialize(drone)
    @drone = drone
    valid_drone!
  end

  def next_instruction
    @last_activity = if dron_processing?
                       Instructor.new(id, drone_last_activity).next_process
                     else
                       Instructor.new(id).next_process
                     end
  end

  def dron_processing?
    last_activity = drone_last_activity
    last_activity.present? && !last_activity.completed?
  end

  def address
    @address ||= Address.find(1)
  end

  private

  def drone_last_activity
    @last_activity ||= Activity.dron_last_activity(id).first
  end

  def valid_drone!
    raise('Drone does not exists') unless drone.is_a?(Drone) && !drone.new_record?
  end
end
