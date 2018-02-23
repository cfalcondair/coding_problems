#!/bin/usr/ruby

require 'date'

# Description
class Solution
  def run(**args)
    sundays = 0
    current_date = Date.new(1901, 1, 1)
    end_date = Date.new(2000, 12, 31)

    loop do
      sundays += 1 if current_date.sunday? && current_date.mday == 1

      current_date = current_date.next
      
      break if end_date < current_date
    end

    sundays
  end
end
