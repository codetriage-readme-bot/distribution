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
  ACTIVITY_ORDER = [:departed, :picked, :reached, :delivered, :arrived].freeze

  enum status: ACTIVITY_ORDER

  belongs_to :drone
  belongs_to :item
end
