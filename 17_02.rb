#!/usr/bin/env ruby
# frozen_string_literal: true

input_area = File.open('input_17_01.txt').read.split("\n").map(&:chars)

LOOKUP = [-1, 0, 1].repeated_permutation(4).to_a - [[0, 0, 0, 0]]

area = Hash.new { |h, k| h[k] = Hash.new { |h, k| h[k] = Hash.new { |h, k| h[k] = {} } } }

(0..24).each do |x|
    (0..24).each do |y|
        (-12..12).each do |z|
            (-12..12).each do |w|
                area[x][y][z][w] = '.'
            end
        end
    end
end

input_area.each_with_index do |row, y|
    row.each_with_index do |val, x|
        area[x+7][y+7][0][0] = val
    end
end


6.times do 
    area_before = area.dup  
    xyzw = []
    (0..24).each do |x|
        (0..24).each do |y|
            (-12..12).each do |z|
                (-12..12).each do |w|
                    count_cubes = 0
                    LOOKUP.each do |offset_x, offset_y, offset_z, offset_w|
                        count_cubes += 1 if area_before[x + offset_x][y + offset_y][z + offset_z][w + offset_w] == '#'
                    end
                    if area[x][y][z][w] == '#' 
                        xyzw << [x,y,z,w,'.'] unless (2..3).include?(count_cubes)
                    else
                        xyzw << [x,y,z,w, '#']  if count_cubes == 3
                    end
                end
            end
        end
    end
    xyzw.each do |x,y,z,w,val|
        area[x][y][z][w] = val
    end
end

count = 0
(0..24).each do |x|
    (0..24).each do |y|
        (-12..12).each do |z|
            (-12..12).each do |w|
                count += 1 if area[x][y][z][w] == '#'
            end
        end 
    end
end

puts count 