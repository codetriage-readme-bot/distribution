# == Schema Information
#
# Table name: items
#
#  id                  :integer          not null, primary key
#  name                :string
#  weight              :integer
#  priority            :integer
#  status              :integer          default("initiate")
#  address_id          :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  delivery_address_id :integer
#

class Item < ApplicationRecord
  enum status: %i(initiate processing completed)

  belongs_to :address
  belongs_to :delivery_address, class_name: 'Address'

  validates_presence_of :name, :weight, :address, :delivery_address

  scope :unfinished, -> { where(status: 'initiate') }
  scope :high_priority, -> { order('priority desc') }
  scope :undelivered, -> { high_priority.unfinished }
end
