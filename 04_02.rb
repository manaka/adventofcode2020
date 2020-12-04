#!/usr/bin/env ruby
# frozen_string_literal: true

input_passports = File.open('input_04_01.txt').read.split("\n\n")

VALID_KEYS = {
    'byr' => /19[2-9][0-9]|200[0-2]/, 
    'iyr' => /201[0-9]|2020/, 
    'eyr' => /202[0-9]|2030/, 
    'hgt' => /19[0-3]cm|1[5-8][0-9]cm|59in|[6][0-9]in|7[0-6]in/,
    'hcl' => /\#[0-9a-f]{6}/,
    'ecl' => /^amb$|^blu$|^brn$|^gry$|^grn$|^hzl$|^oth$/,
    'pid' => /^\d{9}$/, 
    'cid' => /.*/
}.freeze


def passport_valid?(passport_str)
    passport = passport_str.split(/[\s\n]/).map{|e| e.split(':')}.to_h
    keys_check = VALID_KEYS.keys - passport.keys
    if keys_check.empty? || keys_check == ['cid']
        passport.map{|k,v| v.match?(VALID_KEYS[k])}.all?
    else
        false
    end
end

count = 0
input_passports.each do |passport_str|
    if passport_valid?(passport_str)
        count += 1 
    else

    end
end


puts "\n Count: #{count}\n\n"