def stock_picker(prices)
  return [] if prices.empty? || prices.size == 1

  min_price_index = 0
  max_profit = 0
  best_days = [0, 0]

  prices.each_with_index do |price, index|

    if price < prices[min_price_index]
      min_price_index = index
    end

    current_profit = price - prices[min_price_index]

    if current_profit > max_profit && index > min_price_index
      max_profit = current_profit
      best_days = [min_price_index, index]
    end
  end

  best_days
end

prices = [17, 3, 6, 9, 15, 8, 6, 1, 10]
puts stock_picker(prices).inspect
