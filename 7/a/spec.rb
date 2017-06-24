#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of ..." do
      args = {
        prime_count: 6
      }
      response = Solution.new.run(args)

      answer = 13
      expect(response).to eql(answer)
    end

    it "should print out problem case" do
      args = {
        prime_count: 10_001
      }
      response = Solution.new.run(args)

      puts "\nSolution is #{response}"
    end
  end
end
