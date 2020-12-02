#!/usr/bin/env ruby
# frozen_string_literal: true

input_numbers_src = File.open('input_01_01.txt').read
input_numbers = input_numbers_src.split("\n").map(&:to_i)
input_numbers.each_with_index do |number, index|
    ((index + 1)..(input_numbers.size - 1)).each do |ind|
        # puts "#{number} + #{input_numbers[ind]} = #{(number + input_numbers[ind])}";
        puts "#{number} + #{input_numbers[ind]} = 2020;\n #{(number * input_numbers[ind])}" if number + input_numbers[ind] == 2020
    end
end