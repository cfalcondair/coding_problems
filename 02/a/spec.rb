#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should print out problem case" do
      response = Solution.new.run

      puts "\nSolution is #{response}"
    end
  end
end
