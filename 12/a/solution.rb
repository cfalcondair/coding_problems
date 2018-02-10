#!/bin/usr/ruby
$LOAD_PATH.unshift('../../helpers')
require 'prime_helper'

# Description
class Solution
  def run(**args)
    upper_limit = args.fetch(:upper_limit)
    factor_count = args.fetch(:factor_count)
    highest_count = 0

    triangle_numbers_upto(upper_limit) do |triangle_number, count|
      p "running for #{count} at #{triangle_number}"
      next if Math.sqrt(triangle_number) < (factor_count / 2.to_f).ceil

      factors = factors_of(triangle_number)
      current_factors_count = factors.count

      highest_count = current_factors_count unless current_factors_count < highest_count
      p "current highest is #{highest_count}"

      if current_factors_count > factor_count
        p "got iiim at #{count}"
        p factors
        p factors.count
        return triangle_number
      end
    end
  end

  def factors_of(num)
    factors = []
    (Math.sqrt(num).ceil).downto(1).each do |i|
      next unless PrimeHelper.divisable?(num, i)

      result = num / i

      factors << i
      factors << result
    end

    factors.sort
  end

  def triangle_numbers_upto(x)
    1.upto(x).inject(0) do |x, i|
      current = x + i
      yield current, i
      current
    end
  end

  def triangle_number(x)
    1.upto(x).inject(:+)
  end
end
