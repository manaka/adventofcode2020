#!/usr/bin/env ruby
# frozen_string_literal: true

input_commands = File.open('input_09_01.txt').read.split("\n").map(&:to_i)



def find_buggy(input_commands, preamble = 25)    
    for i in preamble..(input_commands.length - 1) do
        return input_commands[i] unless input_commands[i-preamble..i-1].combination(2).to_a.select{|e| e.reduce(:+) == input_commands[i] }.any? 
    end
    nil
end

puts find_buggy(input_commands)