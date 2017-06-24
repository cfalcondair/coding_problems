#!/bin/usr/ruby

$LOAD_PATH.unshift(__dir__ + '/../../helpers')
require 'prime_helper'

# Description
class Solution
  def run(prime_count:)
    count = 0
    PrimeHelper.primes_iterator(10**20) do |prime|
      next unless (count += 1) == prime_count

      return prime
    end
  end
end
