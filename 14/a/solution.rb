#!/bin/usr/ruby

# Description
class Solution
  def initialize()
    @cache = {}
  end

  def run(start)
    largest = 0
    largest_starter = 0
    1.upto(start) do |x|
      response = cycle(x)
      if response > largest
        largest = response 
        largest_starter = x
      end
    end

    puts "largest count at #{largest} for the number #{largest_starter}"

    largest_starter
  end

  def cycle(start)
    x = start.clone

    count = 1

    stack = []
    cache_count = 0

    loop do
      break if x == 1

      cache_count = @cache[x]

      unless cache_count.nil?
        count += cache_count - 1
        break
      end

      count += 1

      x = iterate(x)
      stack << x
    end

    @cache.merge!(make_cache_from_stack(stack, cache_count))

    final_count = count

    puts "final count for #{start} is #{final_count}"

    @cache[start] = final_count

    final_count
  end

  def make_cache_from_stack(stack, cache_count)
    cache_count ||= 0
    stack_size = stack.size
    stack.each_with_index.collect do |x, i|
      distance = stack_size - i + cache_count - 1
      [x, distance]
    end.to_h
  end

  def iterate(x)
    if x.even?
      even(x)
    else
      odd(x)
    end
  end

  def even(x)
    x / 2
  end

  def odd(x)
    x * 3 + 1
  end 
end
