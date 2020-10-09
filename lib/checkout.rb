require_relative 'promotion'
require_relative 'basket'

class Checkout
  attr_reader :rules, :basket

  def initialize(rules)
    @rules = rules
    @basket = Basket.new(promotions(rules), [])
  end

  def scan(item)
    basket.items << item
  end

  private

  def promotions(rules)
    rules.map do |rule|
      Promotion.new(rule[:name], rule[:size], rule[:price])
    end
  end
end