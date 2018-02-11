#!/usr/bin/ruby

$LOAD_PATH.unshift(__dir__)
require 'solution'

describe Solution do
  describe ".run" do
    it "should match example case of ..." do
      data = File.readlines("../data.txt", "\n")
      args = {lines: data, sig_figs: 10}
      response = Solution.new.run(args)

      puts "Solution is \n #{response}"
    end

    it "should print out problem case" do
      lines = [
        "120321091",
        "345832109",
        "531832189",
        "385948921"
      ]
      args = {lines: lines, sig_figs: 2}
      response = Solution.new.run(args)
      expected = "138"

      expect(response).to eql(expected)
    end
  end
end
