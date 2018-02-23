#!/bin/usr/ruby

# Description
class Solution
  def initialize()
    @cache = []
  end

  def run(**args)
    triangle = args.fetch(:triangle)
    triangle_size = triangle.count

    triangle.reverse.each_with_index do |row, row_number|
      y = triangle_size - row_number - 1
      next_y = y + 1

      @cache[y] ||= []
      @cache[next_y] ||= []

      row.each_with_index do |value, x|
        potential_left = @cache[next_y][x] || 0
        potential_right = @cache[next_y][x + 1] || 0

        greatest_potential = potential_left > potential_right ? potential_left : potential_right
        @cache[y][x] = value + greatest_potential
      end
    end

    @cache[0][0]
  end
end
