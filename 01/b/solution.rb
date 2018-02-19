#!/bin/usr/ruby

# This solution doesn't address the situation when there are multiples within the set of multiples
# ie [3, 5, 15]. 3 * 5 = 15
#
# Description:
# For each multiple, you can find the analytical sum of all multiples under the lower bound.
# ie. for multiple(3), upper_bound(10):
# There are 3 (3,6,9,12) multiples under 13
# The sum is equal to Sum(3, 6, 9, 12) = Sum(1, 2, 3, 4) * 3
# So therefore we just need to find the number of multiples under the upper bound
# and add the sum up to that.
# We can also use the fact that the Sum(n) = (n + 1) * n / 2
#
# We then need need to do this for all multiples.
#
# We then need to remove double counts, say for the multiples of [3, 5],
# we have counts multiples of 3 * 5 = 15 twice. So remove those.
class Solution
  def run(multiples:, upper_bound:)
    upper_bound -= 1

    multiple_sums = multiples.collect do |multiple|
      sum_of_multiple_in_upper_bound(multiple, upper_bound)
    end

    total_sum = multiple_sums.sum

    double_count_sums = uniq_products_of_multiples(multiples).collect do |pair_multiple|
      sum_of_multiple_in_upper_bound(pair_multiple, upper_bound)
    end
    total_sum - double_count_sums.sum
  end

  private

  def sum_of_multiple_in_upper_bound(multiple, upper_bound)
    count_of_multiples = upper_bound / multiple
    series_sum = (count_of_multiples + 1) * count_of_multiples / 2
    series_sum * multiple
  end

  def uniq_products_of_multiples(multiples)
    uniq_pairs_of_multiples(multiples).collect do |pair|
      pair.inject(:*)
    end
  end

  def uniq_pairs_of_multiples(multiples)
    pairs = []
    multiples.collect do |multiple|
      array_size = multiples.size - 1
      other_multiples = multiples - [multiple]
      Array.new(array_size, multiple).zip(other_multiples).each do |pair|
        pairs << pair
      end
    end
    pairs.collect(&:sort).uniq
  end
end
