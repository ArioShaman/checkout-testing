# frozen_string_literal: true

require './checkout.rb'
require './spec/spec_helper.rb'

describe 'Checkout' do
  context 'when items [C, B, A, A, D, A, B]' do
    it 'should return 155 £' do
      co = Checkout.new
      co.scan('C')
      co.scan('B')
      co.scan('A')
      co.scan('A')
      co.scan('D')
      co.scan('A')
      co.scan('B')

      expect(co.total).to eq(155)
    end
  end

  context 'when items [A, B, C]' do
    it 'should return 100 £' do
      co = Checkout.new
      co.scan('C')
      co.scan('B')
      co.scan('A')

      expect(co.total).to eq(100)
    end
  end

  context 'when items [B, A, B, A, A]' do
    it 'should return 110 £' do
      co = Checkout.new
      co.scan('B')
      co.scan('A')
      co.scan('B')
      co.scan('A')
      co.scan('A')

      expect(co.total).to eq(110)
    end
  end

  context 'when items [C, A, D, A, A]' do
    it 'should return 140 £' do
      co = Checkout.new
      co.scan('C')
      co.scan('A')
      co.scan('D')
      co.scan('A')
      co.scan('A')

      expect(co.total).to eq(140)
    end
  end
end
