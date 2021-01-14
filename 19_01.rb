#!/usr/bin/env ruby
# frozen_string_literal: true

input_messages = File.open('input_19_01.txt').read.split("\n\n")

rules_unparsed = input_messages[0].split("\n")
messages = input_messages[1].split("\n")
rules = {}

rules_unparsed.each do |rule|
    rule_number, val = rule.split(':')
    val = val.gsub('"','') unless val.match?(/[\d\|]/)
    rules[rule_number.to_i] = val + "\s"
end

until rules.all?{|k, e| e.match?(/^[\(\)ab\|\s]+$/)} do
    rules.select{|k,e| e.match?(/^[\(\)ab\|\s]+$/)}.each do |k,v|
        asd = Regexp.new("\s#{k}[\s\z]")
        rules.select{|a,b| b.match?(asd) }.each do |ind, val|
            rules[ind] = val.gsub(/\s#{k}[\s\z]/, " (#{v}) ") 
        end
    end
end

rules_str =  "^#{rules[0]}$".gsub("\s",'')
puts rules_str
puts messages.count{|e| e.match?(Regexp.new(rules_str))}
=begin
^((a)(((a)(a)|(b)(b))((a)(b)|(b)(a))|((a)(b)|(b)(a))((a)(a)|(b)(b)))(b))$
(a)(((a)(a)|(b)(b))((a)(b)|(b)(a))|((a)(b)|(b)(a))((a)(a)|(b)(b)))(b)

0: aaa|bbab|ba|ab|baaa|bbb
   aaa|bbab|ba|ab|baaa|bbb
1: aa|bbab|ba|ab|baaa|bb  
2: aa|bb
3: ab|ba
4: "a"
5: "b"


0: a(aa|bb)(ab|ba)|(ab|ba)(aa|bb)b
1: (aa|bb)(ab|ba)|(ab|ba)(aa|bb)
2: (aa|bb)
3: (ab|ba)
4: "a"
5: "b"

=end