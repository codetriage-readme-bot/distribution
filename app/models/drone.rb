# == Schema Information
#
# Table name: drones
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Drone < ApplicationRecord
  validates_presence_of :name
end
