# == Schema Information
#
# Table name: addresses
#
#  id              :integer          not null, primary key
#  city            :string
#  street_name     :string
#  building_number :integer
#  zip             :integer
#  state           :string
#  country         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryGirl.define do
  factory :address do
    city            Faker::Address.city
    street_name     Faker::Address.street_name
    building_number Faker::Address.building_number
    zip             Faker::Address.zip
    state           Faker::Address.state
    country         Faker::Address.country
  end
end
