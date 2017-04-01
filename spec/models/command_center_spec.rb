
require 'rails_helper'
require_relative '../spec_helper/activity_spec_helper'

RSpec.describe CommandCenter do
  include ActivitySpecHelper

  describe 'has assigned' do
    it 'non-existing drone' do
      expect { CommandCenter.new(Drone.new) }.to raise_error('Drone does not exists')
    end

    it 'existing drone' do
      drone = FactoryGirl.create(:drone)
      center = CommandCenter.new(drone)
      expect(center).to eq center
    end
  end

  describe '#next_instruction' do
    let(:item) { FactoryGirl.create(:item) }
    let(:processing_item) { FactoryGirl.create(:item, status: 'processing') }
    let(:completed_item) { FactoryGirl.create(:item, status: 'completed') }
    let(:drone) { FactoryGirl.create(:drone) }
    let(:command_center) { CommandCenter.new(drone) }

    it 'drone take a new item and intiate' do
      item
      new_activity = command_center.next_instruction
      expect(new_activity.drone_id).to    eq drone.id
      expect(new_activity.item).to        eq item
      expect(new_activity.progress).to    eq 'departed'
      expect(new_activity.item.status).to eq 'processing'
      expect(Activity.count).to be(1)
    end

    it 'drone should pickup the item' do
      create_activity_order(processing_item, drone, 1)
      new_activity = command_center.next_instruction
      expect(new_activity.progress).to    eq 'picked'
      expect(new_activity.item.status).to eq 'processing'
      expect(Activity.count).to           eq 2
    end

    it 'drone should reached the address' do
      create_activity_order(processing_item, drone, 2)
      new_activity = command_center.next_instruction
      expect(new_activity.progress).to    eq 'reached'
      expect(new_activity.item.status).to eq 'processing'
      expect(Activity.count).to           eq 3
    end

    it 'drone should delivered the item' do
      create_activity_order(processing_item, drone, 3)
      new_activity = command_center.next_instruction
      expect(new_activity.progress).to    eq 'delivered'
      expect(new_activity.item.status).to eq 'processing'
      expect(Activity.count).to           eq 4
    end

    it 'drone should come back to center' do
      create_activity_order(completed_item, drone, 4)
      new_activity = command_center.next_instruction
      expect(new_activity.progress).to    eq 'arrived'
      expect(new_activity.item.status).to eq 'completed'
      expect(Activity.count).to           eq 5
    end

    it 'should be nil if no item exists' do
      expect(command_center.next_instruction).to be_nil
    end

    it 'should be nil if no new item' do
      processing_item
      expect(command_center.next_instruction).to be_nil
    end

    it 'should be nil if items has been completed' do
      completed_item
      expect(command_center.next_instruction).to be_nil
    end
  end

  describe '#dron_processing?' do
    let(:item) { FactoryGirl.create(:item) }
    let(:processing_item) { FactoryGirl.create(:item, status: 'processing') }
    let(:completed_item) { FactoryGirl.create(:item, status: 'completed') }
    let(:drone) { FactoryGirl.create(:drone) }
    let(:command_center) { CommandCenter.new(drone) }

    it 'should return true for existing items' do
      create_activity_order(processing_item, drone, 3)
      expect(command_center.dron_processing?).to be_truthy
    end

    it 'should return false fo existing completed' do
      create_activity_order(processing_item, drone, 5)
      expect(command_center.dron_processing?).to be_falsey
    end

    it 'should return false' do
      expect(command_center.dron_processing?).to be_falsey
    end
  end
end
