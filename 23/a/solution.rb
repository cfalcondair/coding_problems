#!/bin/usr/ruby

require '../../helpers/helper'

# Description
class Solution
  def run(**args)
    x = args.fetch(:x)

    factors = Helper.factors_of(x)
    factors_sum = factors.sum
    abundant_numbers = 1.upto(x).select { |i| abundant_number?(i) }
    all_numbers = 1.upto(x).to_a

    valids = abundant_numbers.collect do |i|
      next if i > x / 2.0

      abundant_numbers.collect do |j|
        i + j
      end
    end.flatten.compact.uniq.sort

    (all_numbers - valids).sum
  end

  def abundant_number?(x)
    factors = Helper.factors_of(x) - [x]
    factors_sum = factors.sum
    factors_sum > x
  end
end
