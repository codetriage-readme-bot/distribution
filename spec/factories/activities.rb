# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  drone_id   :integer
#  item_id    :integer
#  progress   :integer          default("departed")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :activity do
    drone
    item
    progress 1
  end
end
