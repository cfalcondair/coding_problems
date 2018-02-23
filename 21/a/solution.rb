#!/bin/usr/ruby

require '../../helpers/helper'

# Description
class Solution
  def initialize()
    @cache = {}
  end

  def run(**args)
    x = args.fetch(:x)

    amicable_numbers = 1.upto(x - 1).collect do |i|
      factors = Helper.factors_of(i) - [i]
      sum_factors = factors.inject(:+)
      @cache[i] = sum_factors
      if @cache[sum_factors] == i && i != sum_factors
        [sum_factors, i]
      end
    end.compact.flatten

    amicable_numbers.sum
  end
end
