#!/usr/bin/env ruby
# frozen_string_literal: true

input_jolts = File.open('input_10_01.txt').read.split("\n").map(&:to_i).sort!

count_1 = 1
count_3 = 1 

input_jolts[1..-1].each_with_index do |el, ind| 
    diff = el - input_jolts[ind]
    count_1 += 1 if diff == 1
    count_3 += 1 if diff > 1
end

puts (count_1 * count_3)