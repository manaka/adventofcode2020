#!/usr/bin/env ruby
# frozen_string_literal: true

input_math = File.open('input_18_01.txt').read.split("\n")

class Integer
    def -(object)
        self * object
    end
end

sum = input_math.map{|e| eval(e.gsub('*', '-')) }.reduce(:+)

puts sum