# frozen_string_literal: true

class Checkout
  PRICES = {
    'A' => 30,
    'B' => 20,
    'C' => 50,
    'D' => 15
  }.freeze

  def initialize
    @counter = Hash.new(0)
    @purchasing_array = []
  end

  def scan(item)
    purchasing_array.push(item)
    counter[item] += 1
  end

  def total
    total_price = 0

    counter.each do |key, count|
      total_price += PRICES[key] * count
      total_price = use_rules(total_price, key, count)
    end
    total_price -= 20 if total_price > 150

    total_price
  end

  private

  attr_reader :counter, :purchasing_array

  def use_rules(price, key, count)
    case key
    when 'A'
      price -= (count / 3) * 15
    when 'B'
      price -= (count / 2) * 5
    end

    price
  end
end
