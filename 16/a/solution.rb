#!/bin/usr/ruby

# Description
class Solution
  def run(**args)
    power = args[:power]

    (2 ** power).to_s.split(//).map(&:to_i).sum
  end
end
