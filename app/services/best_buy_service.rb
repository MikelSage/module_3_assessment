class BestBuyService
  def initialize(zip)
    @conn = Faraday.new(url: 'https://api.bestbuy.com/v1/') do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
    @zip = zip
  end



  def find_stores_by_zip
    search_params = {apiKey: ENV['best_buy_key'],
                     show: 'name,city,distance,phone,storeType',
                     format: 'json',
                     pageSize: 10
                    }
    endpoint = "stores((area(#{zip},25)))"
    response = get_data(endpoint, search_params)
    results = JSON.parse(response.body, symbolize_names: true)
    {stores: results[:stores], count: results[:total]}
  end

  def get_data(endpoint, params)
    conn.get endpoint, params
  end

  def self.find_stores_by_zip(zip)
    new(zip).find_stores_by_zip
  end

  private
    attr_reader :conn, :zip
end
