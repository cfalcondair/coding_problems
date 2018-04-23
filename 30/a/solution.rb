#!/bin/usr/ruby

# Description
class Solution
  def run(**args)
    power = args.fetch(:power)

    10.upto(1000000).collect do |i|
      sum = get_split_sum(i, power)

      sum if !sum.nil? && i == sum 
    end.compact.sum
  end

  def get_split_sum(i, power)
    i.to_s.split('').collect do |x|
      return if (powered = x.to_i ** power) > i
      
      powered
    end.sum
  end
end
