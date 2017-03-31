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
class Item < ApplicationRecord
  enum status: %i(initiate processing completed)

  validates_presence_of :name, :weight
end
