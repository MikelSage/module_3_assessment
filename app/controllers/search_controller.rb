class SearchController < ApplicationController
  def index
    @presenter = StorePresenter.new(params[:search_box])
  end
end
