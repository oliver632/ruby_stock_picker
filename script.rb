
def stock_picker(prices) 
  #goes through each date pair and reduces into an array of the best buy and sell date combination.
  trade_array = prices.each_with_index.reduce([0,0]) do |day_array, (buy_day, buy_index)|
    #check each sell day against the previously gotten buy day.
    prices.each_with_index do |sell_day, sell_index|
      #reject is sell date is before or same day as buy date
      next if sell_index <= buy_index
      #checks if this date pair is better than previous date pair
      if (sell_day - buy_day) > (prices[day_array[1]] - prices[day_array[0]]) 
        day_array[0] = buy_index
        day_array[1] = sell_index
      end
    end
    #returns to reduce
    day_array
  end

  
  buy_index = trade_array[0]
  sell_index = trade_array[1]
  "Buy on day #{buy_index} and sell on day #{sell_index} for Dkk #{prices[sell]-prices[buy]} in profit"
end

p stock_picker([17,3,6,9,15,8,6,1,10])