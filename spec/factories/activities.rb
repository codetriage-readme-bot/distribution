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

FactoryGirl.define do
  factory :activity do
    drone nil
    item nil
    progress 1
  end
end
