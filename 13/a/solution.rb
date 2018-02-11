#!/bin/usr/ruby
$LOAD_PATH.unshift('../../helpers')
require 'prime_helper'

# Description
class Solution
  # This solution assumes that each line is the same length.
  HIGHEST_DIGIT = 10
  def run(**args)
    lines = args.fetch(:lines)
    sig_figs = args.fetch(:sig_figs)

    extra_sig_figs = (HIGHEST_DIGIT * lines.count).to_s.length

    cut = sig_figs + extra_sig_figs + 1

    relevant_length_lines = lines.collect do |line|
      line[0..cut]
    end

    sum = relevant_length_lines.collect(&:to_i).inject(:+)

    sum.to_s[0..sig_figs-1]
  end
end



9999999999999
9999999999999
9999999999999
9999999999999