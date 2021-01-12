#!/usr/bin/env ruby
# frozen_string_literal: true

input_shuttle = File.open('input_13_01.txt').read.split("\n")

from = input_shuttle[0].to_i
busses = input_shuttle[1].split(',').map{|e| e == 'x' ? e : e.to_i }
step = busses.reject{|e| e == 'x'}.max
shift = busses.find_index(step)
i = 1
x = i * step - shift
loop do
    x = i * step - shift
    check = busses.each_with_index.map{|e, index| e == 'x' ? true : (x + index) % e == 0 }
    break if check.all?(true)
    i += 1
end

puts x
