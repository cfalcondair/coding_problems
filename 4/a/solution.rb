#!/bin/usr/ruby

# Description
class Solution
  def run(digits:)
    current_palindrome = 0
    uniq_pairs(digits) do |i, j|
      product = i * j
      next if product < current_palindrome

      current_palindrome = product if palindrome?(product)
    end
    current_palindrome
  end

  def palindrome?(product)
    product = product.to_s
    product == product.reverse
  end

  def uniq_pairs(digits)
    upper_limit = 10 ** digits - 1
    lower_limit = 10 ** (digits - 1)
    upper_limit.downto(lower_limit).each do |i|
      upper_limit.downto(lower_limit).each do |j|
        next if j > i

        yield [i, j].sort
      end
    end
  end
end
