#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of ..." do
      divisors = 500
      args = {upper_limit: 100000, factor_count: divisors}
      response = Solution.new.run(args)

      if response.nil?
        p "Couldn't find triangle number with over #{divisors} factors"
      else
        p response
      end
    end

    it "should print out problem case" do
      args = {upper_limit: 7, factor_count: 6}
      
      response = Solution.new.run(args)
      expected = 28

      expect(response).to eql(expected)
    end
  end

  describe ".factors_of" do 
    it "should return factors of the number 28 of 1,2,4,7,14,28" do
      input = 28

      response = Solution.new.factors_of(input)
      array = [1, 2, 4, 7, 14, 28]
      
      expect(response).to eql(array)
    end
  end

  describe ".triangle_number" do
    it "should return triangle number 7" do 
      triangle_number = 7

      response = Solution.new.triangle_number(triangle_number)
      expected = 28
      expect(response).to eql(expected)
    end
  end
end
