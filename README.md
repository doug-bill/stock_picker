# Stock Picker

![Ruby](https://img.shields.io/badge/Ruby-CC342D?style=flat&logo=ruby&logoColor=white)
![The Odin Project](https://img.shields.io/badge/The%20Odin%20Project-Curriculum-brightgreen)

## Description

A Ruby implementation of the Stock Picker project built as part of [The Odin Project](https://www.theodinproject.com/) curriculum. Given an array of stock prices — one per day — the method returns the best pair of days to buy and sell for maximum profit.

---

## Table of Contents

- [Usage](#usage)
- [Examples](#examples)
- [How It Works](#how-it-works)
- [Edge Cases](#edge-cases)
- [Installation](#installation)
- [What I Learned](#what-i-learned)

---

## Usage

```ruby
stocks = [17, 3, 6, 9, 15, 8, 6, 1, 10]
stock_picker(stocks)
```

---

## Examples

```ruby
> stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
=> [1, 4]  # buy on day 1 at $3, sell on day 4 at $15 — profit of $12

> stock_picker([1, 10])
=> [0, 1]

> stock_picker([1, 2, 3, 4, 5])
=> [0, 4]
```

---

## How It Works

1. Iterate over every possible buy day using `each_with_index`
2. For each buy day, iterate over every possible sell day that comes after it using a slice `array[buy_day + 1..-1]`
3. Calculate the profit for each buy/sell combination
4. If the current profit beats the best profit seen so far, store it and update the best days
5. Return the pair of days with the highest profit

```ruby
def stock_picker(array)
  best_profit = 0
  best_days = []

  array.each_with_index do |buy_price, buy_day|
    array[buy_day + 1..-1].each.with_index(buy_day + 1) do |sell_price, sell_day|
      current_profit = sell_price - buy_price

      if current_profit > best_profit
        best_profit = current_profit
        best_days = [buy_day, sell_day]
      end
    end
  end

  best_days
end
```

---

## Edge Cases

| Scenario | Example Input | Expected Output |
|---|---|---|
| Highest price is day 0 | `[100, 1, 2, 3, 4]` | buy day < sell day |
| Lowest price is last day | `[10, 8, 6, 4, 2]` | buy day < sell day |
| Prices go up every day | `[1, 2, 3, 4, 5]` | `[0, 4]` |
| Prices go down every day | `[5, 4, 3, 2, 1]` | buy day < sell day |
| Two day array | `[1, 10]` | `[0, 1]` |

---

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/stock-picker.git
```

2. Navigate into the project:
```bash
cd stock-picker
```

3. Run the file:
```bash
ruby stock_picker.rb
```

> No gems or dependencies required — pure Ruby.

---

## What I Learned

- How to use nested iteration with `each_with_index` to compare every combination of two elements
- How to slice an array from a dynamic index using `array[n..-1]`
- How `with_index(offset)` corrects index positions after slicing so they match the original array
- The difference between `push` (accumulates) and direct assignment `= []` (replaces) when tracking the best result
- How to think through edge cases before writing code and test against them systematically

---

## Project

This project is part of the [Ruby Programming path](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby) on The Odin Project.