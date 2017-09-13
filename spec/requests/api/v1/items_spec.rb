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

  it "deletes the requested item" do
    base_items = create_list(:item, 3)
    expect(Item.count).to eq 3

    delete "/api/v1/items/#{base_items.last.id}"

    expect(response).to have_http_status(:no_content)
    expect(Item.count).to eq 2
  end

  it "creates an item" do
    item_params = {item: {
      name: 'The best item',
      description: 'You already know what it is',
      image_url: 'http://via.placeholder.com/350x150'
    }}

    post '/api/v1/items', item_params

    item = JSON.parse(response.body)

    expect(response).to have_http_status(:created)

    expect(item).to_not have_key 'created_at'
    expect(item).to_not have_key 'updated_at'
    expect(item['name']).to eq item_params[:item][:name]
    expect(item['description']).to eq item_params[:item][:description]
    expect(item['image_url']).to eq item_params[:item][:image_url]
  end
end
