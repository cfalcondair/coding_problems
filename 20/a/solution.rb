#!/bin/usr/ruby

# Description
class Solution
  def run(**args)
    x = args.fetch(:x)

    product = factorial_product(x)
    product
      .to_s
      .split(//)
      .map(&:to_i)
      .inject(:+)
  end

  def factorial_product(x)
    1.upto(x).inject(:*)
  end
end
