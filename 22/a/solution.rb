#!/bin/usr/ruby

# Description
class Solution
  ALPHABET = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

  def run(**args)
    names = args.fetch(:names)

    name_scores = names.collect do |name|
      puts name
      score = name.split(//).collect do |letter|
        ALPHABET.index(letter.upcase) + 1
      end.sum
      [name, score]
    end

    name_scores.sort_by! do |name, score|
      name
    end

    names_with_total_scores = name_scores.each_with_index.collect do |(name, score), i|
      [name, score * (i + 1)]
    end

    names_with_total_scores.collect(&:last).sum
  end
end
