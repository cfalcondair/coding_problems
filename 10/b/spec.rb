#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of ..." do
      args = {
        upper_limit: 10
      }
      response = Solution.new.run(args)

      answer = 17
      expect(response).to eql(answer)
    end

    it "should print out problem case" do
      args = {
        upper_limit: 2_000_000
      }
      response = Solution.new.run(args)

      puts "\nSolution is #{response}"
    end
  end
end
