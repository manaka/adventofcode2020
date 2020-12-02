#!/usr/bin/env ruby
# frozen_string_literal: true

input_passwords = File.open('input_02_01.txt').read.split("\n")

count = 0 

input_passwords.each do |pwd_line|
    pwd_repeat, letter, pwd = pwd_line.split("\s")
    lower, upper = pwd_repeat.split('-').map(&:to_i)
    count += 1 if pwd.scan(letter[0]).size.between?(lower,upper)
end

puts count