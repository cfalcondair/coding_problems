#!/bin/usr/ruby

# Description
class Solution
  def run(**args)
    '0123456789'.split(//).permutation.collect(&:join).sort[999999]
  end
end
