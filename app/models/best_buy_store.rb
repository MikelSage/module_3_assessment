class BestBuyStore
  attr_reader :name, :city, :phone,
              :distance, :type
  def initialize(attrs)
    @name     = attrs[:name]
    @city     = attrs[:city]
    @phone    = attrs[:phone]
    @distance = attrs[:distance]
    @type     = attrs[:storeType]
  end

  def self.from_data(zip)
    raw_data = BestBuyService.find_stores_by_zip(zip)[:stores]
    BestBuyStore.create_stores(raw_data)
  end

  def self.create_stores(raw_data)
    raw_data.map do |raw_store|
      BestBuyStore.new(raw_store)
    end
  end
end
