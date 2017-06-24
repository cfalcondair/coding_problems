#!/bin/usr/ruby

# Iterative Solution
class Solution
  def run(multiples:, upper_bound:)
    lower_bound = multiples.min
    factors = (lower_bound..upper_bound - 1).select do |num|
      multiple?(num, multiples)
    end

    factors.sum
  end

  def multiple?(num, multiples)
    multiples.any? do |multiple|
      num % multiple == 0
    end
  end
end
