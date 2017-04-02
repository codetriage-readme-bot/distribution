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
  before_save :name_downcase

  def delivered
    Activity.where(drone_id: id, progress: 'arrived').count
  end
  
  private

  def name_downcase
    self.name = name.downcase if name_changed?
  end

end
