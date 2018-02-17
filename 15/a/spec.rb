#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of 2x2 grid has 6 ways of traversing" do
      args = {grid_size: 2}
      response = Solution.new.run(args)

      answer = 6
      expect(response).to eql(answer)
    end

    it "should match example case of 3x3 grid has 12 ways of traversing" do
      args = {grid_size: 3}
      response = Solution.new.run(args)

      answer = 20
      expect(response).to eql(answer)
    end

    it "should match example case of 4x4 grid has 20 ways of traversing" do
      args = {grid_size: 4}
      response = Solution.new.run(args)

      answer = 70
      expect(response).to eql(answer)
    end

    it "should print out problem case" do
      args = {grid_size: 20}
      response = Solution.new.run(args)

      puts "\nSolution is #{response}"
    end
  end
end
