# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  name       :string
#  weight     :integer
#  priority   :integer
#  status     :integer          default("initiate")
#  address_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :item do
    name     Faker::Name.name
    weight   Faker::Number.digit
    priority Faker::Number.digit
    status   0
    address
  end
end
