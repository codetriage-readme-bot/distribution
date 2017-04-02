# DroneDecorator
class DroneDecorator < Draper::Decorator
  delegate :delivered
  delegate_all

  def job_available?
    command_center.next_instruction?
  end

  def pick_job
    command_center.next_instruction
  end

  def list_of_instructions
    flag = false
    Instructor::INSTRUCTION_ORDER.map do |status|
      maped_hash = { status: flag, name: status.to_s }
      flag = matched_activity?(status)
      maped_hash
    end
  end

  def progress_length
    activity = command_center.last_completed_activity
    (activity.progress_before_type_cast + 1) * 2 * 10
  end

  private

  def command_center
    @command_center ||= CommandCenter.new(object)
  end

  def matched_activity?(status)
    detect_activity.to_sym == status
  end

  def detect_activity
    command_center.last_completed_activity.present? ? command_center.last_activity.progress : nil
  end
end
