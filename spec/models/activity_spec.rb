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

require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'verify association' do
    it { should belong_to(:drone) }
    it { should belong_to(:item) }
  end

  describe 'validations' do
    let(:activity_status) { Activity::ACTIVITY_ORDER }
    it { should define_enum_for(:status).with(activity_status) }
  end
end
