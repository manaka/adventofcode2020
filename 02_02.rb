#!/usr/bin/env ruby
# frozen_string_literal: true

input_passwords = File.open('input_02_01.txt').read.split("\n")

count = 0 

input_passwords.each do |pwd_line|
    pwd_repeat, letter, pwd = pwd_line.split("\s")
    lower, upper = pwd_repeat.split('-').map{|n| n.to_i - 1}
    count += 1 if (pwd[lower] == letter[0]) ^ (pwd[upper] == letter[0])
end

puts count