#!/bin/usr/ruby

# Description
class Solution

  def initialize()
    @cache = {}
    @match_count = nil
  end

  def run(**args)
    @grid_size = args[:grid_size]

    (@grid_size).downto(0) do |start|
      step_towards_goal(start)
    end

    @cache[[0, 0]]
  end

  def step_towards_goal(start)
    start.upto(@grid_size) do |downs|
      start.upto(@grid_size) do |rights|
        next if !@cache[[rights, downs]].nil?
        return if !@cache[[0, 0]].nil?

        @match_count = 0
        
        two_step(rights, downs)

        p "#{[rights, downs]} = count of #{@match_count}"
        @cache[[rights, downs]] = @match_count
      end
    end
  end

  def step(rights, downs)
    return @match_count += 1 if rights == @grid_size && downs == @grid_size
    return @match_count += @cache[[rights, downs]] if !@cache[[rights, downs]].nil?

    two_step(rights, downs)
  end

  def two_step(rights, downs)
    step(rights + 1, downs) unless rights == @grid_size
    step(rights, downs + 1) unless downs == @grid_size
  end
end
