class SearchController < ApplicationController
  def index
    conn = Faraday.new(url: 'https://api.bestbuy.com/v1/stores') do ||

    end
  end
end
