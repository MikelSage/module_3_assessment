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
    expect(item).to_not have_key 'created_at'
    expect(item).to_not have_key 'updated_at'
  end

  it "returns a single item" do
    base_item = create(:item)

    get "/api/v1/items/#{base_item.id}"

    expect(response).to be_success

    item = JSON.parse(response.body)

    expect(item['name']).to eq base_item.name
    expect(item['description']).to eq base_item.description
    expect(item['image_url']).to eq base_item.image_url
    expect(item).to_not have_key 'created_at'
    expect(item).to_not have_key 'updated_at'
  end
end
