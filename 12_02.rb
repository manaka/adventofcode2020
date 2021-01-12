#!/usr/bin/env ruby
# frozen_string_literal: true

input_instructions = File.open('input_12_01.txt').read.split("\n")


class Nav

    attr_reader :x, :y, :direction, :value, :instruction, :w_x, :w_y

    def initialize
        @x = 0
        @y = 0
        @w_x = 10
        @w_y = 1
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
            @x += @w_x * value 
            @y += @w_y * value
        when 'L'
            (value / 90).times do
                @w_x = -1 * @w_y 
                @w_y = @w_x
            end
        when 'R'
            (value / 90).times do
                @w_x = @w_y 
                @w_y = -1 * @w_x
            end

        end
    end

    def take_direction(direction, value)
        case direction
        when 'N'
            @w_y += value
        when 'S'
            @w_y -= value
        when 'E'
            @w_x += value
        when 'W'
            @w_x -= value
        end
    end
end

ship = Nav.new
# ship.move_to 'F10'
# ship.move_to 'N3'
# ship.move_to 'F7'
# ship.move_to 'R90'
# ship.move_to 'F11'


input_instructions.each do |instruction|
    ship.move_to instruction
end
puts "x: #{ship.x}, y: #{ship.y}; wx: #{ship.w_x}, wy: #{ship.w_y}"
# 178986
# puts "x: #{ship.x}, y: #{ship.y}"
puts ship.x.abs + ship.y.abs
