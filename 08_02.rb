#!/usr/bin/env ruby
# frozen_string_literal: true

input_commands = File.open('input_08_01.txt').read.split("\n").map(&:split)



def get_acc(input_commands, acc=0, position=0)    
    @visited_position[position] += 1
    
    
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

    return acc if position == input_commands.length 
    return acc if @visited_position[position] > 30

    get_acc(input_commands, acc, position)
end

def qwe(input_commands)
    input_commands.each_index.select{|i| input_commands[i][0] == 'jmp' || input_commands[i][0] == 'nop'}.each do |fixed_position|
        @visited_position = Hash.new(0)
        ic = input_commands.clone 
        k = input_commands[fixed_position]
        ic[fixed_position] = [k[0] == 'jmp' ? 'nop' : 'jmp', k[1]]
        x =  get_acc(ic)
        puts "acc: #{x}" if @visited_position[input_commands.length-1] > 0 
    end        
end

qwe(input_commands)
