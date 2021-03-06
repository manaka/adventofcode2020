#!/usr/bin/env ruby
# frozen_string_literal: true
require 'colorize'
@input_map = File.open('input_03_01.txt').read.split("\n")


def slope_down(shift_x, shift_y)
    x = 0
    y = 0
    count = 0 

    finish_x = @input_map[0].size - 1
    finish_y = @input_map.size
    
    while y < finish_y do 
        if @input_map[y][x] == '#'
            count += 1
        end
        # @input_map[y][x] = @input_map[y][x].red
        x += shift_x;        
        y += shift_y;
        x = x - finish_x - 1 if x > finish_x  
        
    end 
    count    
end

total = slope_down(3, 1) 
# puts @input_map


puts "\n Count: #{total}\n\n"