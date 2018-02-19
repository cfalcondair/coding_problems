#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of multiples below 10 equal to 23" do
      response = Solution.new.run(
        multiples: [3, 5],
        upper_bound: 10
      )

      answer = 23
      expect(response).to eql(answer)
    end

    it "should print out problem case" do
      response = Solution.new.run(
        multiples: [3, 5],
        upper_bound: 1000
      )

      puts "\nSolution to problem 1 is #{response}"
    end
  end
end
