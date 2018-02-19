#!/bin/usr/ruby

# Description
class Solution
  def initialize()
    @numbers_as_words = {
      1 => 'one',
      2 => 'two',
      3 => 'three',
      4 => 'four',
      5 => 'five',
      6 => 'six',
      7 => 'seven',
      8 => 'eight',
      9 => 'nine'
    }
    @teen_numbers_as_words = {
      10 => 'ten',
      11 => 'eleven',
      12 => 'twelve',
      13 => 'thirteen',
      14 => 'fourteen',
      15 => 'fifteen',
      16 => 'sixteen',
      17 => 'seventeen',
      18 => 'eighteen',
      19 => 'nineteen'
    }
    @tens_as_words = {
      2 => 'twenty',
      3 => 'thirty',
      4 => 'forty',
      5 => 'fifty',
      6 => 'sixty',
      7 => 'seventy',
      8 => 'eighty',
      9 => 'ninety'
    }
  end

  def run(**args)
    upper_limit = args[:upper_limit]

    counts = 1.upto(upper_limit).collect do |x|
      word = to_word(x)
      word.gsub(/[^a-z]/, "").size
    end

    counts.sum
  end

  def to_word(x)
    result = ""

    teen = if (teen_match = x.to_s.match(/[^0]\d{1}$/))
      number = teen_match[0].to_i
      @teen_numbers_as_words[number]
    end

    ten = if (ten_match = x.to_s.match(/([^01])\d{1}$/))
      number = ten_match[1].to_i
      @tens_as_words[number]
    end

    digit = if (digit_match = x.to_s.match(/[^0]$/))
      number = digit_match[0].to_i
      @numbers_as_words[number]
    end

    hundred = if (hundred_match = x.to_s.match(/([^0])\d{2}$/))
      number = hundred_match[1].to_i
      hundred_digit = @numbers_as_words[number]
      "#{hundred_digit} hundred"
    end

    thousand = if (thousand_match = x.to_s.match(/([^0])\d{3}$/))
      number = thousand_match[1].to_i
      thousand_digit = @numbers_as_words[number]
      "#{thousand_digit} thousand"
    end

    result += " #{thousand}" unless thousand.nil?
    result += " #{hundred}" unless hundred.nil?
    result += " and" unless (thousand.nil? && hundred.nil?) || (teen.nil? && ten.nil? && digit.nil?)
    if !teen.nil?
      result += " #{teen}" 
    else
      result += " #{ten}" unless ten.nil?
      result += " #{digit}" unless digit.nil?
    end
    result.strip
  end
end
