#!/usr/bin/env ruby
# frozen_string_literal: true

input_numbers = File.open('input_15_01.txt').read.split(',').map(&:to_i)

numbers = input_numbers
from = numbers.length
mem = Hash.new { |h, k| h[k] = [] }
numbers.each_with_index{|e, i| mem[e] << i }

(from..30_000_000).each do |step|
    previous_number = numbers[step - 1]

    if mem[previous_number].count == 1 
        numbers[step] = 0
        mem[0] << step
    else
        number = mem[previous_number].last(2).reverse.reduce(&:-)    
        mem[number] << step
        numbers[step] = number
    end
end

puts numbers[30_000_000 - 1]
