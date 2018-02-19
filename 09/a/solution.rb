#!/bin/usr/ruby

# Description
class Solution
  # find numbers(a, b, c) that square together to find solution(s)
  # a < b
  # b < c
  # a + b + c = s
  # 0 < a, b, c < s - 1
  # a**2 + b**2 = c**2

  # a cannot be greater than s / 3 because given a < b and b < c, if a is greater than s / 3 than a + b + c > s
  def run(solution:)
    pythagorean_triplet = find_triplet(solution)
    pythagorean_triplet.inject(:*)
  end

  def find_triplet(solution)
    valid_triplets(solution) do |triplet|
      return triplet if pythagorean?(triplet)
    end
  end

  def valid_triplets(solution)
    a_upper_limit = (solution / 3.0).ceil
    b_upper_limit = (solution / 2.0).ceil
    (1..a_upper_limit).each do |a|
      (a..b_upper_limit).each do |b|
        c = solution - b - a

        yield [a, b, c]
      end
    end
  end

  def pythagorean?(triplet)
    a, b, c = triplet
    a ** 2 + b ** 2 == c ** 2
  end
end
