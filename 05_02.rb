#!/usr/bin/env ruby
# frozen_string_literal: true

input_seats = File.open('input_05_01.txt').read.split("\n")

input_seats.map! do |boarding_pass|
    boarding_pass.tr!('FLBR','0011')
    row = boarding_pass[0,7].to_i(2)
    column = boarding_pass[7,10].to_i(2)
    row * 8 + column
end
input_seats.sort!
input_seats.each_with_index{|s, i| puts s + 1 if s+1 != input_seats[i+1]}