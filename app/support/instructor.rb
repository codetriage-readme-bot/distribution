# Instruct next step what to do to drone
class Instructor
  INSTRUCTION_ORDER = %i(departed picked reached delivered arrived).freeze

  attr_reader :activity
  def initialize(drone_id, activity = nil)
    @drone_id = drone_id
    @activity = activity
  end

  def next_process
    return nil unless next_process?
    if activity.present?
      pick_next_activity
    else
      pick_new_item
    end
  end

  def next_process?
    item = Item.undelivered.first
    return item.present? if activity.nil?
    activity.completed? ? item.present? : true
  end

  def current_index_state
    INSTRUCTION_ORDER.index(activity.progress.to_sym)
  end

  def next_index_state
    INSTRUCTION_ORDER[current_index_state + 1]
  end

  private

  def pick_next_activity
    if activity.completed?
      pick_new_item
    else
      next_activity
    end
  end

  def pick_new_item
    item = Item.undelivered.first
    if item.present?
      item.processing!
      @activity = Activity.create_activity(item.id, @drone_id)
    end
    @activity
  end

  def next_activity
    activity_item.completed! if activity.delivered?
    Activity.create_activity(activity_item.id, @drone_id, next_index_state)
  end

  def activity_item
    activity.present? ? activity.item : Item.new
  end
end
