class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.bestbuy.com/v1/') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end

    search_params = {apiKey: ENV['best_buy_key'],
                     show: 'name,city,distance,phone,storeType',
                     format: 'json',
                     pageSize: 10
                    }

    response = conn.get 'stores((area(80202,25)))', search_params
    parsed = JSON.parse(response.body, symbolize_names: true)
    raw_stores = parsed[:stores]
    @count = parsed[:total]
    @stores = raw_stores.map do |attrs|
      BestBuyStore.new(attrs)
    end
  end
end
