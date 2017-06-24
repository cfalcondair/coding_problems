#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of ..." do
      args = {
        digits: 2
      }
      response = Solution.new.run(args)

      answer = 9009
      expect(response).to eql(answer)
    end

    it "should print out problem case" do
      args = {
        digits: 3
      }
      response = Solution.new.run(args)

      puts "\nSolution is #{response}"
    end
  end
end
