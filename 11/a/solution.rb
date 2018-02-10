#!/bin/usr/ruby

# Description
class Solution
  SIZE = 4
  def run
    largest_sum = 0
    total = all_collections_as_ints.size
    all_collections_as_ints.each_with_index do |collection, i|
      sum = collection.inject(:*)
      p collection
      p sum
      p largest_sum
      largest_sum = sum if largest_sum < sum
    end

    largest_sum
  end

  def all_collections_as_ints
    all_collections.collect do |collection|
      collection.collect(&:to_i)
    end
  end

  def all_collections
    load_horizontal_numbers +
    load_vertical_numbers +
    load_l_to_r_diagonal_numbers +
    load_r_to_l_diagonal_numbers
  end

  def grid
    @grid ||= load_grid
  end

  def load_horizontal_numbers
    grid.each_with_object([]) do |row, collection|
      (row.size - SIZE + 1).times do |x|
        collection << row[x..(x + SIZE - 1)]
      end
    end
  end

  def load_vertical_numbers
    collection = []
    grid.size.times do |x|
      (grid.size - SIZE + 1).times do |y|
        numbers = SIZE.times.collect do |i|
          grid[y + i][x]
        end
        collection << numbers
      end
    end
    collection
  end

  def load_l_to_r_diagonal_numbers
    collection = []
    (grid.size - SIZE + 1).times do |x|
      (grid.size - SIZE + 1).times do |y|
        numbers = SIZE.times.collect do |i|
          grid[y + i][x + i]
        end
        collection << numbers
      end
    end
    collection
  end

  def load_r_to_l_diagonal_numbers
    collection = []
    (grid.size - SIZE + 1).times do |x|
      (grid.size - SIZE + 1).times do |y|
        numbers = SIZE.times.collect do |i|
          grid[y + i][x + (SIZE - 1) - i]
        end
        collection << numbers
      end
    end
    collection
  end

  def load_grid
    File.read(__dir__ + '/../data/grid.txt').split("\n").collect do |row|
      row.split(' ')
    end
  end
end
