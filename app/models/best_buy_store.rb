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
end
