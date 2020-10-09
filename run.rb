class Basket
  attr_reader :promotions, :items

  def initialize(promotions, items)
    @promotions = promotions
    @items = items
  end

  def calculate
    base_price = items.map(&:price).sum
    return base_price if promotions.empty?
    return total_discount(base_price) if find_total_discount.any? && find_total_discount.first.size > base_price

    items_discount(base_price)
  end

  private

  def find_total_discount
    promotions.select { |p| p.name == 'total'}
  end

  def total_discount(base_price)
    base_price - find_total_discount.first.price
  end

  def items_discount(base_price)
    promotions.each do |promotion|
      items_promotion = items.select{ |item| item.name == promotion.name }
      next unless items_promotion.size == promotion.size

      base_price -= items_promotion.map(&:price).sum
      base_price += promotion.price
    end
    base_price
  end
end