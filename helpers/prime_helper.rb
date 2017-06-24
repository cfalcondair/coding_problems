module PrimeHelper
  module_function

  def prime_factors(number)
    current_upper_bound = number

    prime_factors = []
    loop do
      primes_iterator(current_upper_bound) do |prime|
        if divisable?(number, prime)
          prime_factors << prime
          current_upper_bound /= prime
        end
      end

      break if 1 == current_upper_bound
    end

    prime_factors
  end

  def primes_iterator(limit, should_yield = true)
    yield 2 if should_yield
    number = 3
    primes_seen = [2]
    iterator = 2
    loop do
      break if number > limit

      if prime_from_primes?(number, primes_seen)
        primes_seen << number
        yield number if should_yield
      end
      number += iterator
    end

    primes_seen
  end

  def prime?(i)
    primes_iterator(limit) do |prime|
      divisable?(i, prime)
    end
  end

  def prime_from_primes?(i, lower_primes)
    !lower_primes.any? do |factor|
      divisable?(i, factor)
    end
  end

  def divisable?(number, factor)
    number % factor == 0
  end
end
