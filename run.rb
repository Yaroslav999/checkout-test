require_relative 'lib/item'
require_relative 'lib/checkout'

def run
  @item_1 = Item.new('A', 30)
  @item_2 = Item.new('B', 20)
  @item_3 = Item.new('C', 50)
  @item_4 = Item.new('D', 15)
  @rules = [{name: 'A', size: 3, price: 75}, {name: 'B', size: 2, price: 35}, {name: 'total', size: 150, price: 20}]
  run_1_basket
  run_2_basket
  run_3_basket
  run_4_basket
end

def run_1_basket
  co_1 = Checkout.new(@rules)
  co_1.scan(@item_1)
  co_1.scan(@item_2)
  co_1.scan(@item_3)
  p co_1.total
end

def run_2_basket
  co_1 = Checkout.new(@rules)
  co_1.scan(@item_2)
  co_1.scan(@item_1)
  co_1.scan(@item_2)
  co_1.scan(@item_1)
  co_1.scan(@item_1)
  p co_1.total
end

def run_3_basket
  co_3 = Checkout.new(@rules)
  co_3.scan(@item_1)
  co_3.scan(@item_1)
  co_3.scan(@item_1)
  co_3.scan(@item_2)
  co_3.scan(@item_2)
  co_3.scan(@item_3)
  co_3.scan(@item_4)
  p co_3.total
end

def run_4_basket
  co_4 = Checkout.new(@rules)
  co_4.scan(@item_1)
  co_4.scan(@item_1)
  co_4.scan(@item_1)
  co_4.scan(@item_3)
  co_4.scan(@item_4)
  p co_4.total
end

run
