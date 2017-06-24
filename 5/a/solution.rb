#!/bin/usr/ruby

$LOAD_PATH.unshift(__dir__ + '/../../helpers')
require 'prime_helper'

# Description
# Find all numbers in the divisable range that can be divided by another number in that range
# iterate with the highest divisor until the answer is found.
class Solution
  def run(upper_limit:)
    divisors = (2..upper_limit).reject do |divisor|
      divide_any?(divisor, ((divisor + 1)..upper_limit).to_a)
    end

    iterator = divisors.last
    # iterate by the highest divisor
    number = upper_limit / iterator * iterator + iterator

    loop do
      break if divisable_by_all?(number, divisors)

      number += iterator
    end
    number
  end

  def divisable_by_all?(number, divisors)
    divisors.all? do |divisor|
      PrimeHelper.divisable?(number, divisor)
    end
  end

  def divide_any?(divisor, numbers)
    numbers.any? do |number|
      PrimeHelper.divisable?(number, divisor)
    end
  end
end
