#!/usr/bin/env ruby
# frozen_string_literal: true

input_numbers = File.open('input_15_01.txt').read.split(',').map(&:to_i)

numbers = input_numbers
from = numbers.length

(from..2019).each do |step|
    previous_number = numbers[step - 1]

    if numbers.count(previous_number) == 1 
        numbers[step] = 0
    else
        # numbers.count(previous_number) > 1
        numbers[step] = numbers.each_with_index.select{|num, i| num == previous_number}.map{|p| p[1]}.last(2).reverse.reduce(:-)
    end
end

puts numbers[2019]
