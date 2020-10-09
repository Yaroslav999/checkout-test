class Basket
  attr_reader :promotions, :items

  def initialize(promotions, items)
    @promotions = promotions
    @items = items
  end
end