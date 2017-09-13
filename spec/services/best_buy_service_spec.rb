require 'rails_helper'

describe BestBuyService do
  context 'class methods' do
    describe '.find_by_zip' do
      VCR.use_cassette('services/from_zip') do
        raw_stores = BestBuyService.find_by_zip('80202')
        raw_store = raw_stores.first

        expect(raw_stores.count).to eq 10

        expect(raw_store).to have_key 'name'
        expect(raw_store[:name]).to be_a String

        expect(raw_store).to have_key 'city'
        expect(raw_store[:city]).to be_a String

        expect(raw_store).to have_key 'distance'
        expect(raw_store[:distance]).to be_a Float

        expect(raw_store).to have_key 'phone'
        expect(raw_store[:phone]).to be_a String

        expect(raw_store).to have_key 'storeType'
        expect(raw_store[:storeType]).to be_a String
      end
    end
  end
end
