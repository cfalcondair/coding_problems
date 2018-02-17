#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of ..." do
      args = {power: 15}
      response = Solution.new.run(args)

      answer = 26
      expect(response).to eql(answer)
    end

    it "should print out problem case" do
      args = {power: 1000}
      response = Solution.new.run(args)

      puts "\nSolution is #{response}"
    end
  end
end
