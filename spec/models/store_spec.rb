require 'rails_helper'

RSpec.describe BestBuyStore do
  describe 'creation' do
    it "can be created with valid attributes" do
      attrs = {
            city: "Denver",
            phone: "303-270-9189",
            name: "CHERRY CREEK MALL",
            distance: 3.45,
            storeType: "Mobile SAS"
        }

        store = BestBuyStore.new(attrs)

        expect(store.name).to eq attrs[:name]
        expect(store.city).to eq attrs[:city]
        expect(store.phone).to eq attrs[:phone]
        expect(store.distance).to eq attrs[:distance]
        expect(store.type).to eq attrs[:storeType]
    end
  end

  describe 'class methods' do
    describe '.from'
  end
end
