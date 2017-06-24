#!/bin/usr/ruby

$LOAD_PATH.unshift(__dir__ + '/../../helpers')
require 'prime_helper'

# Description
class Solution
  PRIME_FACTORS = [2, 3, 5, 7]

  def run(digits:, number:)
    number_str = number.to_s
    largest_digits_str = digits_str_data_structure('2')
    iterate_subset_str_in_str(digits, number_str) do |subset_str|
      largest_prime_factors = largest_digits_str[:prime_factors_under_10]
      subset_prime_factors = subset_str[:prime_factors_under_10]
      largest_digits_product = product_of_primes_of_a_not_b(largest_prime_factors, subset_prime_factors)
      potential_digits_product = product_of_primes_of_a_not_b(subset_prime_factors, largest_prime_factors)

      if potential_digits_product > largest_digits_product
        largest_digits_str = subset_str
      end
    end
    largest_digits_str[:digits].split(//).collect(&:to_i).inject(:*)
  end

  def iterate_subset_str_in_str(digits, number_str)
    number_size = number_str.size
    digit_iterator = digits - 1
    (0..number_size - digits).each do |i|
      digits_str = number_str[i..i+digit_iterator]
      next if digits_str.include?('0')

      yield digits_str_data_structure(digits_str)
    end
  end

  def digits_str_data_structure(number_str)
    {
      digits: number_str,
      prime_factors_under_10: digits_str_to_prime_factors_array(number_str)
    }
  end

  def digits_str_to_prime_factors_array(number_str)
    digits_prime_factors = number_str.split(//).collect do |number|
      prime_factors_as_array(number.to_i)
    end
    digits_prime_factors.inject([0, 0, 0, 0]) do |single_digit_prime_factors, prime_factors|
      prime_factors.zip(single_digit_prime_factors).collect(&:sum)
    end
  end

  def prime_factors_as_array(number)
    prime_factors = PrimeHelper.prime_factors(number)
    PRIME_FACTORS.collect do |prime|
      prime_factors.count(prime)
    end
  end

  def primes_a_not_b(a, b)
    a.zip(b).collect do |a_i, b_i|
      [a_i - b_i, 0].max
    end
  end

  def product_of_primes_of_a_not_b(a, b)
    numerator_a = 1
    primes_a_not_b(a, b).each_with_index do |power, index|
      prime = PRIME_FACTORS[index]
      numerator_a *= prime ** power
    end
    numerator_a
  end
end
