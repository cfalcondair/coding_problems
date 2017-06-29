#!/bin/usr/ruby

$LOAD_PATH.unshift(__dir__ + '/../../helpers')
require 'prime_helper'

# Description
class Solution
  def run(upper_limit:)
    primes_below_limit(upper_limit).inject(:+)
  end

  def primes_below_limit(upper_limit)
    sieve = create_sieve(upper_limit)
    primes = []
    sieve.each_with_index do |is_prime, idx|
      primes.push(idx) if is_prime
    end

    primes
  end

  def create_sieve(upper_limit)
    sieve = [true] * upper_limit
    sieve[1] = false
    sqrt_upper_limit = Math.sqrt(upper_limit).ceil
    (2..sqrt_upper_limit).each do |i|
      is_prime = sieve[i]
      next unless is_prime

      lower_limit = 2 * i
      (lower_limit..upper_limit).step(i) do |multiple|
        sieve[multiple] = false
      end
    end

    sieve
  end
end
