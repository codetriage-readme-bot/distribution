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

class Address < ApplicationRecord
end
