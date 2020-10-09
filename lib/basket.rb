class Basket
  attr_reader :promotions, :items

  def initialize(promotions, items)
    @promotions = promotions
    @items = items
  end

  def calculate
    base_price = items.sum(&:price)
    return items_discount(base_price) unless find_total_discount.any? && find_total_discount.first.size < items_discount(base_price)

    total_discount(items_discount(base_price))
  end

  private

  def find_total_discount
    promotions.select { |p| p.name == 'total'}
  end

  def total_discount(base_price)
    base_price - find_total_discount.sum(&:price)
  end

  def items_discount(base_price)
    promotions.inject(base_price) do |price, promotion|
      items_promotion = items.select{ |item| item.name == promotion.name }
      items_promotion.size == promotion.size ? price - (items_promotion.sum(&:price) - promotion.price) : price
    end
  end
end