#!/usr/bin/env ruby
# frozen_string_literal: true

input_passports = File.open('input_04_01.txt').read.split("\n\n")

VALID_KEYS = %w{byr iyr eyr hgt hcl ecl pid cid}.freeze # cid is optional


def passport_valid?(passport_str)
    passport = passport_str.split(/[\s\n]/).map{|e| e.split(':')}.to_h
    keys_check = VALID_KEYS - passport.keys
    keys_check.empty? || keys_check == ['cid']
end

count = 0
input_passports.each do |passport_str|
    count += 1 if passport_valid?(passport_str)
end


puts "\n Count: #{count}\n\n"