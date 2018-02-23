#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'prime_helper'

module Helper
  module_function

  def factors_of(num)
    factors = []
    (Math.sqrt(num).ceil).downto(1).each do |i|
      next unless PrimeHelper.divisable?(num, i)

      result = num / i

      factors << i
      factors << result
    end

    factors.sort.uniq
  end
end