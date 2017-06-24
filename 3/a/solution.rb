#!/bin/usr/ruby

# Iterate over primes and find which primes are factors, take the largest one.
#
# We implemented a prime number iterator that first yields 2, then tries to find primes
# iterating from the number 3 by 2. The reason we iterate by two is because no even numbers are prime numbers.
#
# We also stop looking for prime factors above the hard limit of the sqrt of the upper_bound
# because the largest prime number(Pi) for N can be no larger than Pi**2, so we stop testing above that number.
class Solution
  def run(upper_bound:)
    primes_found = []
    primes(upper_bound) do |prime|
      break if prime > Math.sqrt(upper_bound).ceil

      primes_found << prime if divisable?(upper_bound, prime)
    end
    primes_found.last
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
