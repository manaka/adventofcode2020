#!/usr/bin/env ruby
# frozen_string_literal: true

input_p = File.open('input_11_01.txt').read.split("\n").map{|e| e.chars.to_a}

SEAT_OFFSET = [-1, 0, 1].repeated_permutation(2).to_a - [[0, 0]]

def flip_seats(input_plan)
    orig = input_plan.dup.map(&:dup)
    max_y = input_plan.size - 1
    max_x = input_plan.first.size - 1

    (0..max_y).each do |y|
        (0..max_x).each do |x|
            next if input_plan[y][x] == '.'
            a = []
            lngth = [max_x - x, max_y - y, x, y].max

            SEAT_OFFSET.each do |offset_y, offset_x|
                (1..lngth).each do |look|     
                    next if (offset_y*look + y) < 0 || (offset_x*look + x < 0) || (offset_y*look + y) > max_y || (offset_x*look + x) > max_x
                    break if orig[offset_y*look + y][offset_x*look + x] == 'L'
                    a << orig[offset_y*look + y][offset_x*look + x]
                    break if orig[offset_y*look + y][offset_x*look + x] == '#'
                end
            end
            input_plan[y][x] = '#' if orig[y][x] == 'L' && a.count('#') == 0
            input_plan[y][x] = 'L' if orig[y][x] == '#' && a.count('#') >= 5
        end
    end
    input_plan
end

orig = input_p.dup.map(&:dup)
flipped = flip_seats(orig.dup.map(&:dup))


while orig != flipped do
    orig = flipped.dup.map(&:dup)
    flipped = flip_seats(orig.dup.map(&:dup))
end

# puts flipped.map(&:join).join("\n")
puts flipped.flatten.select{|e| e == '#' }.size