#!/usr/bin/env ruby
# frozen_string_literal: true

input_instructions = File.open('input_12_01.txt').read.split("\n")


class Nav

    attr_reader :x, :y, :direction, :value, :instruction

    def initialize
        @x = 0
        @y = 0
        @direction = 'E'
        @value = 0
        @directions = %w{N E S W}
    end

    def move_to(instruction)
        action = instruction[0]
        value  = instruction[1..-1].to_i
        if %w{F L R}.include?(action)
            take_action(action, value)
        else
            take_direction(action, value)
        end
    end


    def take_action(action, value)        
        case action
        when 'F'
            take_direction(@direction, value)    
        when 'L'
            index = @directions.index(@direction)            
            @direction = @directions[index - parsed(value)] 
        when 'R'
            index = @directions.index(@direction)
            here = index + parsed(value)
            here = here > (@directions.size - 1) ? here - @directions.size : here
            @direction = @directions[here]     
        end
    end

    def parsed(value)
        case value.to_i
        when 90
            1
        when 180
            2
        when 270
            3
        when 360
            0
        when 0
            0
        end
    end

    def take_direction(direction, value)
        case direction
        when 'N'
            @y += value
        when 'S'
            @y -= value
        when 'E'
            @x += value
        when 'W'
            @x -= value
        end
    end
end

x = Nav.new
input_instructions.each do |instruction|
    x.move_to instruction
end

puts "x: #{x.x}, y: #{x.y}"
puts x.x.abs + x.y.abs
