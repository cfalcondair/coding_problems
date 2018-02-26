#!/bin/usr/ruby

# Description
class Solution
  def run(**args)
    length = args.fetch(:x)
    prev1 = 1
    prev2 = 1
    current = fibonacci(prev1, prev2)
    count = 2

    loop do 
      current = fibonacci(prev1, prev2)
      prev2 = prev1
      prev1 = current
      count += 1
      
      break if current.to_s.size == length
    end

    count
  end

  def fibonacci(prev1, prev2)
    prev1 + prev2
  end
end
