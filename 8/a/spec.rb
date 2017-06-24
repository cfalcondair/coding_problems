#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    let(:number) { [
      '73167176531330624919225119674426574742355349194934',
      '96983520312774506326239578318016984801869478851843',
      '85861560789112949495459501737958331952853208805511',
      '12540698747158523863050715693290963295227443043557',
      '66896648950445244523161731856403098711121722383113',
      '62229893423380308135336276614282806444486645238749',
      '30358907296290491560440772390713810515859307960866',
      '70172427121883998797908792274921901699720888093776',
      '65727333001053367881220235421809751254540594752243',
      '52584907711670556013604839586446706324415722155397',
      '53697817977846174064955149290862569321978468622482',
      '83972241375657056057490261407972968652414535100474',
      '82166370484403199890008895243450658541227588666881',
      '16427171479924442928230863465674813919123162824586',
      '17866458359124566529476545682848912883142607690042',
      '24219022671055626321111109370544217506941658960408',
      '07198403850962455444362981230987879927244284909188',
      '84580156166097919133875499200524063689912560717606',
      '05886116467109405077541002256983155200055935729725',
      '71636269561882670428252483600823257530420752963450'
    ].join('')

 }
    it "should match example case of ..." do
      args = {
        digits: 4,
        number: number
      }
      response = Solution.new.run(args)

      answer = 5832
      expect(response).to eql(answer)
    end

    it "should print out problem case" do
      args = {
        digits: 13,
        number: number
      }
      response = Solution.new.run(args)

      puts "\nSolution is #{response}"
    end
  end

  describe ".prime_factors_as_array" do
    it "should return prime factors of 9 as an array of prime numbers" do
      response = Solution.new.prime_factors_as_array(9)

      answer = [0, 2, 0, 0]
      expect(response).to eql(answer)
    end
  end

  describe ".primes_a_not_b" do
    it "should return prime factors of a not in b" do
      a = [2, 1, 0, 4]
      b = [1, 3, 1, 0]
      response = Solution.new.primes_a_not_b(a, b)

      answer = [1, 0, 0, 4]
      expect(response).to eql(answer)
    end
  end

  describe ".product_of_primes_of_a_not_b" do
    it "should return product of prime factors of a not in b" do
      a = [2, 1, 0, 4]
      b = [1, 3, 1, 0]
      response = Solution.new.product_of_primes_of_a_not_b(a, b)

      answer = 4802
      expect(response).to eql(answer)
    end
  end
end
