#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of ..." do
      triangle = File.readlines("../example_data.txt").map do |line|
        line.split(' ').map(&:to_i)
      end
      args = {triangle: triangle}
      response = Solution.new.run(args)

      answer = 23
      expect(response).to eql(answer)
    end

    it "should print out problem case" do
      triangle = File.readlines("../problem_data.txt").map do |line|
        line.split(' ').map(&:to_i)
      end
      args = {triangle: triangle}
      response = Solution.new.run(args)

      puts "\nSolution is #{response}"
    end
  end
end
