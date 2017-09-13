class SearchController < ApplicationController
  def index
    data = BestBuyService.find_stores_by_zip(params[:search_box])
    raw_stores = data[:stores]
    @count = data[:count]
    @stores = raw_stores.map do |attrs|
      BestBuyStore.new(attrs)
    end

    @stores = BestBuyStore.from_data(params[:search_box])
  end
end
