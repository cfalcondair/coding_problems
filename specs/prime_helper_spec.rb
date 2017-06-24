#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__ + '/../helpers')
require 'prime_helper'

describe PrimeHelper do
  describe ".divisable?" do
    it "should confirm is divisable" do
      expect(PrimeHelper.divisable?(6, 3)).to eql(true)
    end

    it "should confirm is not divisable" do
      expect(PrimeHelper.divisable?(6, 7)).to eql(false)
    end
  end

  describe ".prime_from_primes?" do
    it "should return number is a prime" do
      primes = [2,3,5,7,11]
      number = 13
      expect(PrimeHelper.prime_from_primes?(number, primes)).to eql(true)
    end

    it "should return number is a not prime" do
      number = 12
      primes = [2,3,5,7,11]
      expect(PrimeHelper.prime_from_primes?(number, primes)).to eql(false)
    end
  end

  describe ".primes_iterator" do
    it "should iterate over prime numbers under a non-prime limit" do
      limit = 20
      primes = []
      expected_primes = [2, 3, 5, 7, 11, 13, 17, 19]
      PrimeHelper.primes_iterator(limit) do |prime|
        primes << prime
      end
      expect(primes).to eql(expected_primes)
    end

    it "should iterate over prime numbers under a prime limit" do
      limit = 23
      primes = []
      expected_primes = [2, 3, 5, 7, 11, 13, 17, 19, 23]
      PrimeHelper.primes_iterator(limit) do |prime|
        primes << prime
      end
      expect(primes).to eql(expected_primes)
    end
  end
end
