# Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

#   > stock_picker([17,3,6,9,15,8,6,1,10])
#   => [1,4]  # for a profit of $15 - $3 == $12

# Quick Tips:

#     You need to buy before you can sell
#     Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.

# What I'm thinking now:
# 
# variables 
# best_day = int : placeholder to receive and compare with the other days
# current_profit
# 
# best_day.value  
# 
# 1. Caluculate the meadian of the arrays to have half point of comparision
# cuz the best day to buy needs to have a lower price than the median the whole array.
# 
# 2. Scan the array to compare each day with the median and only pick days where the stock is lower than the median
# 3. iterate i
# 4.
# 
def median (array)
   return nil if array.empty?
   sorted = array.sort
   len = sorted.length
   (sorted [(len - 1) / 2] + sorted[len / 2]) / 2
 
end

stocks = [17,3,6,9,15,8,6,1,10]

def stock_picker (array)
  best_profit = 0
  best_days = []  
  
  array.each_with_index do |buy_price, buy_day|
    #puts "Day: #{buy_day} - Stock price: $#{buy_price}\n"
    array[buy_day + 1 .. -1].each.with_index(buy_day +1) do |sell_price, sell_day| # maybe I don't need the sell_price on this line, can it be a var inside the loop ?
       # puts current_profit =  sell_price - buy_price 
      current_profit = sell_price - buy_price
 			puts "Buy day #{buy_day} at $#{buy_price} → Sell day #{sell_day} at $#{sell_price} = profit $#{current_profit}"
      
      if current_profit > best_profit
        best_profit = current_profit
        best_days.push(buy_day , sell_day)  
      end
    end
  end
  puts "For a profit of $ #{best_profit} the best days to buy and then sell are:"
  best_days[-2..-1] 
end 

stock_picker(stocks)

# I'm thinking of iterating on the array to creating a hash that holds uses the index to see which Day [Keys] it is and will hold the stock price on the value of that key.
# 

