#!/usr/bin/env ruby
# frozen_string_literal: true

input_numbers_src = File.open('input_01_01.txt').read
input_numbers = input_numbers_src.split("\n").map(&:to_i)
input_length = input_numbers.size - 1
input_numbers.each_with_index do |number, index|
    ((index + 1)..input_length).each do |ind|
        ((ind + 1)..input_length).each do |i| 
            puts "#{number} + #{input_numbers[ind]} + #{input_numbers[i]} = 2020;\n #{(number * input_numbers[ind] * input_numbers[i])}" if number + input_numbers[ind] + input_numbers[i] == 2020
        end
        
    end
end