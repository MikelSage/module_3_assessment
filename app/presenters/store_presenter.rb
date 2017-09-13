class StorePresenter
  def initialize(zip)
    @zip = zip
  end

  def stores
    BestBuyStore.from_data(@zip)
  end

  def count
    BestBuyService.find_stores_by_zip(@zip)[:count]
  end
end
