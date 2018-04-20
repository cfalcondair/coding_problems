#!/bin/usr/ruby

# Description
class Solution
  def run(**args)
    upper_limit = args.fetch(:upper_limit)
    collection = []

    2.upto(upper_limit) do |a|
      2.upto(upper_limit) do |b|
        collection << a ** b
      end
    end

    collection.uniq.sort.count
  end
end
