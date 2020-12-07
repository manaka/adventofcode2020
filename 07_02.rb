#!/usr/bin/env ruby
# frozen_string_literal: true

input_bag_rules = File.open('input_07_01.txt').read.split("\n")

rules = {}

input_bag_rules.each do |rule|
    x = rule.match(/^(\w+\s\w+)\sbags\scontain(.*)/).captures
    if x[1] == ' no other bags.' 
        rules[x[0]] = {}
    else
        rules[x[0]] = x[1].gsub(/bag[s]?\.?/,'').split(',').map(&:strip).map{|e| w = e.split("\s"); {w[-2..-1].join(" ") => w[0].to_i }}
    end      
end

def color_quntity(bags, color)
    total = 1
    bags[color].each do |rule|
        if rule != {} 
            total += rule.values.first *  color_quntity(bags, rule.keys.first) 
        end
    end
    total
end

puts color_quntity(rules, 'shiny gold') - 1
