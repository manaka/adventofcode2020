#!/usr/bin/env ruby
# frozen_string_literal: true

input_commands = File.open('input_14_01.txt').read.split("\n")

mask_str = input_commands[0].split('=').last.strip

def make_mask(mask_str)
    mask_on = mask_str.gsub('X', '0')
    mask_off = mask_str.gsub('X', '1')
    [mask_on.to_i(2), mask_off.to_i(2)]
end

mask = 0
mem = {}

input_commands.each do |cl|
    command, value = cl.split(' = ')
    if command == 'mask'
        mask = make_mask(value)
    else
        pos = command.match(/\d+/).to_a.first.to_i
        mem[pos] = value.to_i & mask[0] | mask[1]
    end
end

puts mem.values.sum