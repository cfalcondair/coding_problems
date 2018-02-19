#!/bin/usr/ruby

# Iterative Solution
class Solution
  def run
    terms = []
    iterate_fibonacci do |i|
      terms << i if add?(i)
    end
    puts terms
    terms.sum
  end

  def iterate_fibonacci(current = 1)
    terms = [current, current]

    loop do
      break if break?(current)

      yield current
      current = terms.sum
      terms = [current, terms.first]
    end
  end

  def break?(current)
    current > 4_000_000
  end

  def add?(current)
    current.even?
  end
end
