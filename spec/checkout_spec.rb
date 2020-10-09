require_relative '../lib/checkout'
require_relative '../lib/item'

describe Checkout do
  let(:item_1) { Item.new('A', 30) }
  let(:item_2) { Item.new('B', 20) }
  let(:item_3) { Item.new('C', 50) }
  let(:item_4) { Item.new('D', 15) }
  let(:rules) { [{name: 'A', size: 3, price: 75}, {name: 'B', size: 2, price: 35}, {name: 'total', size: 150, price: 20}] }
  let(:checkout) { Checkout.new(rules) }

  context 'check 1-st basket' do
    before do
      checkout.scan(item_1)
      checkout.scan(item_2)
      checkout.scan(item_3)
    end

    it 'should be 100' do
      expect(checkout.total).to eq(100)
    end

    it 'should not be 145' do
      expect(checkout.total).to_not eq(145)
    end
  end

  context 'check 2-nd basket' do
    before do
      checkout.scan(item_2)
      checkout.scan(item_1)
      checkout.scan(item_2)
      checkout.scan(item_1)
      checkout.scan(item_1)
    end

    it 'should be 110' do
      expect(checkout.total).to eq(110)
    end

    it 'should not be 145' do
      expect(checkout.total).to_not eq(145)
    end
  end

  context 'check 3-rd basket' do
    before do
      checkout.scan(item_1)
      checkout.scan(item_1)
      checkout.scan(item_1)
      checkout.scan(item_2)
      checkout.scan(item_2)
      checkout.scan(item_3)
      checkout.scan(item_4)
    end

    it 'should be 155' do
      expect(checkout.total).to eq(155)
    end

    it 'should not be 145' do
      expect(checkout.total).to_not eq(145)
    end
  end

  context 'check 4-th basket' do
    before do
      checkout.scan(item_1)
      checkout.scan(item_1)
      checkout.scan(item_1)
      checkout.scan(item_3)
      checkout.scan(item_4)
    end

    it 'should be 140' do
      expect(checkout.total).to eq(140)
    end

    it 'should not be 145' do
      expect(checkout.total).to_not eq(145)
    end
  end
end