require 'rails_helper'

describe 'Items API' do
  it "returns a list of items" do
    base_items = create_list(:item, 3)

    get '/api/v1/items'

    expect(response).to be_success

    items = JSON.parse(response.body)
    item = items.first

    expect(items.count).to eq 3
    expect(item).to have_key 'name'
    expect(item).to have_key 'description'
    expect(item).to have_key 'image_url'
  end
end
