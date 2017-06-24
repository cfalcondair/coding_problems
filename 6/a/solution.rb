#!/bin/usr/ruby

# Brute Force
class Solution
  def run(upper_limit:)
    square_of_sum(upper_limit) - sum_of_squares(upper_limit)
  end

  def square_of_sum(upper_limit)
    (1..upper_limit).to_a.sum ** 2
  end

  def sum_of_squares(upper_limit)
    (1..upper_limit).sum do |num|
      num ** 2
    end
  end
end
