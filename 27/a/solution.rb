 #!/bin/usr/ruby

require '../../helpers/prime_helper'

class Solution
  def run(**args)
    max_count = 0 
    parameters = []
    limit = 1000
    0.upto(limit) do |a|
      next if a.even?

      p a
      PrimeHelper.primes_iterator(limit) do |b|
        count = consecutive_primes(a, b)
        if max_count < count
          max_count = count
          parameters = [a, b]
        end

        count = consecutive_primes(a, -b)
        if max_count < count
          max_count = count
          parameters = [a, -b]
        end

        count = consecutive_primes(-a, b)
        if max_count < count
          max_count = count
          parameters = [-a, b]
        end

        count = consecutive_primes(-a, -b)
        if max_count < count
          max_count = count
          parameters = [-a, -b]
        end
      end
    end

    parameters.first * parameters.last
  end

  def consecutive_primes(a, b)
    x = 0
    loop do
      quadratic_value = quadratic(a, b, x)
      break if !PrimeHelper.prime?(quadratic_value)

      x += 1
    end

    x
  end

  def quadratic(a, b, x)
    x ** 2 + x * a + b
  end
end
