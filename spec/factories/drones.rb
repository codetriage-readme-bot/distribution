# == Schema Information
#
# Table name: drones
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :drone do
    name Faker::Name.name
  end
end
