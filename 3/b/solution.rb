#!/bin/usr/ruby

# This approach uses the fact that a number is equal to the product of all its prime factors.
#
# We implemented a prime number iterator that first yields 2, then tries to find primes
# iterating from the number 3 by 2. The reason we iterate by two is because no even numbers are prime numbers.
#
# When ever we find a prime factor, we divide the original number by that prime factor to get the prioduct of the
# remaining factors. We keep going until our new upper limit is equal to 1 meaning we have found all the prime factors.
#
# Therefore we can take the largest prime_factor and return that.
class Solution
  def run(upper_bound:)
    current_upper_bound = upper_bound

    primes(upper_bound) do |prime|
      if divisable?(upper_bound, prime)
        if 1 == (current_upper_bound /= prime)
          return prime
        end
      end
    end
  end

  def primes(limit)
    yield 2
    number = 3
    primes_seen = [number]
    iterator = 2
    loop do
      break if number > limit

      if prime?(number, primes_seen)
        primes_seen << number
        yield number
      end
      number += iterator
    end
  end

  def prime?(i, lower_primes)
    !lower_primes.any? do |factor|
      divisable?(i, factor)
    end
  end


  def divisable?(number, factor)
    number % factor == 0
  end
end
