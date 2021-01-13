#!/usr/bin/env ruby
# frozen_string_literal: true

input_tickets = File.open('input_16_01.txt').read.split("\n\n")

a = input_tickets[0].split("\n").map{|e| e.split(': ')[1] }.map{|e| e.split(' or ')}
a = a.map{|x| x.map{|e| z = e.split('-');z[0].to_i..z[1].to_i }}
ranges = a
errs = []

nearby_tickets = input_tickets[2].split("\n")[1..-1].map{|e| e.split(',').map(&:to_i )}.flatten
nearby_tickets.each do |ticket|
    errs << ticket unless ranges.any?{|x| x[0].include?(ticket) || x[1].include?(ticket) }
end

puts errs.reduce(:+)