# frozen_string_literal: true

require './checkout.rb'

co = Checkout.new
co.scan('C')
co.scan('B')
co.scan('A')
co.scan('A')
co.scan('D')
co.scan('A')
co.scan('B')

price = co.total
puts price
