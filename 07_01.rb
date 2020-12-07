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

def color_search(bags, color)
    out = []
    bags.select{|_,v| v.size > 0 }.each do |bag, rule|
        if rule.map(&:keys).include?([color])
            out << bag
            out << color_search(bags, bag)
        end
    end
    out
end

puts color_search(rules, 'shiny gold').flatten.uniq.size
