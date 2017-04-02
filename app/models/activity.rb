# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  drone_id   :integer
#  item_id    :integer
#  progress   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Activity < ApplicationRecord
  ACTIVITY_ORDER = Instructor::INSTRUCTION_ORDER

  enum progress: ACTIVITY_ORDER

  belongs_to :drone
  belongs_to :item

  scope :dron_last_activity, ->(drone_id) { where(drone_id: drone_id).order(id: :desc) }

  alias completed? arrived?

  def self.create_activity(item_id, drone_id, progress = 0)
    create(item_id: item_id, drone_id: drone_id, progress: progress)
  end

end
