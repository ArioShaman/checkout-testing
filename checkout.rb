class Checkout

  def initialize()
    @prices = {
      "A" => 30,
      "B" => 20,
      "C" => 50,
      "D" => 15
    }

    @counter  = Hash.new(0)

    @purchasing_array = []
  end

  def scan(item)
    @purchasing_array.push(item)
    @counter[item] +=1
  end

  def total
    totalPrice = 0

    @counter.each do |key, count|
      totalPrice += @prices[key]*count

      totalPrice = self.useRules(totalPrice, key, count)

    end

    if totalPrice > 150
      totalPrice -= 20
    end

    return totalPrice
  end

  def useRules(price, key, count) 
    case key  
      when "A"
        price -= (count/3)*15
      when "B"
        price -= (count/2)*5
    end

    return price

  end
end