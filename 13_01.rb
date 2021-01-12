#!/usr/bin/env ruby
# frozen_string_literal: true

input_shuttle = File.open('input_13_01.txt').read.split("\n")

from = input_shuttle[0].to_i
busses = input_shuttle[1].split(',').reject{|e| e == 'x'}.map(&:to_i)

bus_index = busses.map{|e| from.to_f/e }.map{|e| e.to_s.gsub(/^\d+./,'0.') }.each_with_index.max.last
bus = busses[bus_index]
time = (from.to_f/bus).ceil * bus - from

puts bus * time