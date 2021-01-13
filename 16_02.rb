#!/usr/bin/env ruby
# frozen_string_literal: true

input_tickets = File.open('input_16_01.txt').read.split("\n\n")

a = input_tickets[0].split("\n").map{|e| e.split(': ')[1] }.map{|e| e.split(' or ')}
a = a.map{|x| x.map{|e| z = e.split('-');z[0].to_i..z[1].to_i }}
ranges = a
variants = Hash.new { |h, k| h[k] = [] }

nearby_tickets = input_tickets[2].split("\n")[1..-1].map{|e| e.split(',').map(&:to_i )}
nearby_tickets.delete_if do |ticket|
    !ticket.all?{|e| ranges.any?{|x| x[0].include?(e) || x[1].include?(e) }}
end

my_ticket = input_tickets[1].split("\n")[1].split(',').map(&:to_i)

#only valid tickets
nearby_tickets

#departure conditions
departure_ranges = input_tickets[0].split("\n").select{|e| e.match(/^departure.*/)}.map{|e| e.split(': ')[1] }.map{|e| e.split(' or ')}
departure_ranges = departure_ranges.map{|x| x.map{|e| z = e.split('-'); z[0].to_i..z[1].to_i }}

(0..(nearby_tickets.size - 1)).each do |sl|
    column = nearby_tickets.map{|e| e[sl]}
    ranges.each_with_index do |ranges, index|
        if column.all?{|e| ranges[0].include?(e) || ranges[1].include?(e) }
            variants[index] << sl
        end
    end 
end

single_variant = variants.select{|k,v| v.size == 1}.values.first
loop do
    variants.select{|k,v| v.size > 1 }.map{|k,v| variants[k] = v - single_variant }
    single_variant = variants.select{|k,v| v.size == 1 }.values.flatten
    break if variants.select{|k,v| v.size == 1 } == variants.size
end

my_ticket[variants[0].first] * my_ticket[variants[1].first] * my_ticket[variants[2].first] * my_ticket[variants[3].first] * my_ticket[variants[4].first] * my_ticket[variants[5].first]