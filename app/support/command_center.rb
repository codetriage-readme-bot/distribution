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
    return nil unless next_instruction?
    @last_activity = instructor_intiate.next_process
  end

  def next_instruction?
    instructor_intiate.next_process?
  end

  def address
    @address ||= Address.find(1)
  end

  def last_completed_activity
    last_activity || drone_last_activity
  end

  def next_activity_name
    instructor_intiate(drone_last_activity).next_index_state.to_s
  end

  private

  def dron_processing?
    last_activity = drone_last_activity
    last_activity.present? && !last_activity.completed?
  end

  def instructor_intiate(activity = any_activity)
    Instructor.new(id, activity)
  end

  def any_activity
    dron_processing? ? drone_last_activity : nil
  end

  def drone_last_activity
    @last_activity ||= Activity.dron_last_activity(id).first
  end

  def valid_drone!
    raise('Drone does not exists') unless drone.is_a?(Drone) && !drone.new_record?
  end
end
