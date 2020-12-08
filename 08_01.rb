#!/usr/bin/env ruby
# frozen_string_literal: true

input_commands = File.open('input_08_01.txt').read.split("\n").map(&:split)

@visited_position = Hash.new(0)

def get_acc(input_commands, acc, position)    
    @visited_position[position] += 1
    return acc if @visited_position[position] > 1

    cmd, arg = input_commands[position]
    case cmd
        when 'nop'
            position += 1
        when 'acc'
            acc += arg.to_i
            position += 1
        when 'jmp'
            position += arg.to_i
    end
    

    
    get_acc(input_commands, acc, position)

end

puts get_acc(input_commands, 0, 0)
# puts @visited_position.to_s
