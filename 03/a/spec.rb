#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of largest prime factor of 13195 is 29" do
      args = {
        upper_bound: 13195
      }
      response = Solution.new.run(args)

      answer = 29
      expect(response).to eql(answer)
    end

    it "should print out problem case" do
      args = {
        upper_bound: 600_851_475_143
      }
      response = Solution.new.run(args)

      puts "\nSolution is #{response}"
    end
  end
end
