#!/bin/usr/ruby
require 'bigdecimal'

# Description
class Solution
  def run(**args)
    @longest_length = 0
    longest = nil
    x = args.fetch(:x)

    big_decimal_1 = BigDecimal.new("1")
    1.upto(x) do |i|
      @covered_recursion = {}
      puts "number #{i} huh "

      recursion_value = recursion(i)
      next if recursion_value.nil?

      recursion_length = recursion_value.size
      puts "recursion of #{recursion_value} has length of #{recursion_length}"

      if @longest_length < recursion_length
        @longest_length = recursion_length
        longest = i
      end
    end

    longest
  end

  def recursion(x, upper_limit = 5)
    return if upper_limit > 1000000
    
    puts "attempt #{upper_limit}"
    decimal_string = decimal(x, upper_limit)

    0.upto(decimal_string.size) do |select_limit|
      0.upto(select_limit - 1) do |select_offset|
        recurring_option = decimal_string[select_offset..select_limit]
        next if select_offset + 2 * recurring_option.size  > decimal_string.size

        key = [select_limit, select_offset]
        next unless @covered_recursion[key].nil?

        @covered_recursion[key] = true
        
        next if recurring_option.empty?

        reg = /\d{#{select_offset}}#{recurring_option}#{recurring_option}/

        if !decimal_string.match(reg).nil?
          return recurring_option if !decimal(x, upper_limit * 3).match(/\d{#{select_offset}}#{recurring_option}#{recurring_option}#{recurring_option}/).nil?
        end
      end
    end

    recursion(x, upper_limit * 2)
  end

  def decimal(x, upper_limit)
    BigDecimal.new("1").div(BigDecimal.new(x.to_s), upper_limit).to_s[0..-4].split('.').last
  end
end
