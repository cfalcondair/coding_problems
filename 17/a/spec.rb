#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of ..." do
      args = {upper_limit: 5}
      response = Solution.new.run(args)

      answer = 19
      expect(response).to eql(answer)
    end

    it "should match example case of ..." do
      args = {upper_limit: 100}
      response = Solution.new.run(args)

      answer = 864
      expect(response).to eql(answer)
    end

    it "should print out problem case" do
      args = {upper_limit: 1000}
      response = Solution.new.run(args)

      puts "\nSolution is #{response}"
    end
  end
end
