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

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'validate attributes response' do
    let!(:address) do
      FactoryGirl.create(:address, city: 'Imogeneborough', street_name: 'Larkin Fork',
                                   building_number: 1, zip: 600_096, state: 'California',
                                   country: 'United States')
    end

    it { expect(address.city).to            eq('Imogeneborough') }
    it { expect(address.street_name).to     eq('Larkin Fork') }
    it { expect(address.building_number).to eq(1) }
    it { expect(address.zip).to             eq(600_096) }
    it { expect(address.state).to           eq('California') }
    it { expect(address.country).to         eq('United States') }
    it { expect(Address.count).to           be(1) }
  end

  describe '.command_center' do
    it 'find command_center address' do
      address = FactoryGirl.create(:address, id: 1)
      expect(Address.command_center).to eq(address)
    end
  end
end
