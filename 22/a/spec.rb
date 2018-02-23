#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should print out problem case" do
      names = File.readlines('../p022_names.txt').collect do |line|
        line.gsub('"', '').split(',')
      end.flatten
      args = {names: names}
      response = Solution.new.run(args)

      puts "\nSolution is #{response}"
    end
  end
end
