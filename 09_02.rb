#!/usr/bin/env ruby
# frozen_string_literal: true

input_commands = File.open('input_09_01.txt').read.split("\n").map(&:to_i)



def find_buggy(input_commands, preamble = 25)        
    for i in preamble..(input_commands.length - 1) do
        unless input_commands[i-preamble..i-1].combination(2).to_a.select{|e| e.reduce(:+) == input_commands[i] }.any? 
            return input_commands[i]
        end
    end
end

def find_set(input_commands, sum_to_find)
    
    input_commands.each_with_index do |e, i|
        j = 1
        while j < input_commands.length do
            slice = input_commands[i...j]
            if slice.reduce(:+) === sum_to_find
                slice.sort!
                code = slice[0] + slice[-1]
                return code
            end
            j += 1
        end
        i += 1
    end
end

sum_to_find = find_buggy(input_commands)
puts find_set(input_commands, sum_to_find).to_s