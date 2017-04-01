# Instruct next step what to do to drone
class Instructor
  INSTRUCTION_ORDER = %i(departed picked reached delivered arrived).freeze

  attr_reader :activity
  def initialize(drone_id, activity = nil)
    @drone_id = drone_id
    @activity = activity
  end

  def next_process
    if activity.present?
      pick_next_activity
    else
      pick_new_item
    end
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
    item = Item.high_priority.unfinished.first
    if item.present?
      item.processing!
      @activity = Activity.create(item: item, drone_id: @drone_id)
    end
    @activity
  end

  def next_activity
    item.completed! if activity.delivered?
    next_index = INSTRUCTION_ORDER[current_index_state + 1]
    Activity.create(item: item, drone_id: @drone_id, progress: next_index)
  end

  def current_index_state
    INSTRUCTION_ORDER.index(activity.progress.to_sym)
  end

  def item
    activity.present? ? activity.item : nil
  end
end
