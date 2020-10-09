class Promotion
  attr_reader :name, :size, :price

  def initialize(name, size, price)
    @name = name
    @size = size
    @price = price
  end
end