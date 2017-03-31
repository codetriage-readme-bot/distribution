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

require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validate association' do
    it { should belong_to(:address) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:weight) }
    it { should define_enum_for(:status).with(%i(initiate processing completed)) }
  end

  describe 'validate attributes response' do
    before(:all) do
      @first_address = FactoryGirl.create(:address)
    end
    let(:item) do
      FactoryGirl.create(:item, name: 'Item Name', weight: 10, priority: 2,
                                status: 'initiate', address_id: @first_address.id)
    end

    it { expect(item.name).to       eq('Item Name') }
    it { expect(item.weight).to     eq(10) }
    it { expect(item.priority).to   eq(2) }
    it { expect(item.status).to     eq('initiate') }
    it { expect(item.address_id).to eq(@first_address.id) }
  end
end
