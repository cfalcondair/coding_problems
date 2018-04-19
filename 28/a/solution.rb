#!/bin/usr/ruby

# Description
class Solution
  def run(**args)
    grid_size = args.fetch(:grid_size)

    fail if grid_size.even?

    depth = grid_size / 2

    diagonals(depth).sum + 1
  end

  def diagonals(depth)
    from = 1
    1.upto(depth).to_a.collect do |d|
      iterator = d * 2

      4.times.collect do 
        from = from + iterator
      end
    end.flatten
  end
end
