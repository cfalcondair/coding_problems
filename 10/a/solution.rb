#!/bin/usr/ruby

$LOAD_PATH.unshift(__dir__ + '/../../helpers')
require 'prime_helper'

# Description
class Solution
  def run(limit:)
    sum = 0
    PrimeHelper.primes_iterator(limit) do |n|
      puts n if n % 5000 < 10
      sum += n
    end

    sum
  end
end
