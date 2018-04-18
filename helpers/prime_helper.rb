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
      break if number > limit.abs

      if prime_from_primes?(number, primes_seen)
        primes_seen << number
        yield number if should_yield
      end
      number += iterator
    end

    primes_seen
  end

  def prime?(x)
    return true if pre_loaded_prime?(x)

    primes_iterator(x) do |prime|
      next if x == prime

      return false if divisable?(x, prime)
    end

    add_prime(x)
    true
  end

  def prime_from_primes?(i, lower_primes)
    !lower_primes.any? do |factor|
      divisable?(i, factor)
    end
  end

  def divisable?(number, factor)
    number % factor == 0
  end

  def add_prime(prime)
    @primes ||= []

    @primes << prime.abs unless pre_loaded_prime?(prime)
  end

  def pre_loaded_prime?(x)
    @primes ||= []

    @primes.include?(x.abs)
  end
end
