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
require_relative '../spec_helper/activity_spec_helper'

RSpec.describe Activity, type: :model do
  include ActivitySpecHelper
  describe 'verify association' do
    it { should belong_to(:drone) }
    it { should belong_to(:item) }
  end

  describe 'validations' do
    let(:activity_status) { Activity::ACTIVITY_ORDER }
    it { should define_enum_for(:progress).with(activity_status) }
  end

  describe '.dron_last_activity' do
    let(:drone) { FactoryGirl.create(:drone) }

    it 'should return last Activity of a drone' do
      item = FactoryGirl.create(:item)
      create_activity_order(item, drone, 2)
      expect(Activity.dron_last_activity(drone.id).first.progress).to eq('picked')
    end
  end

  describe '#completed?' do
    let(:drone) { FactoryGirl.create(:drone) }

    it 'should return last Activity of a drone' do
      activity = FactoryGirl.create(:activity, progress: 'arrived')
      expect(activity.completed?).to be_truthy
    end
  end
end
