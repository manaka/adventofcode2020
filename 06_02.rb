#!/usr/bin/env ruby
# frozen_string_literal: true

input_forms = File.open('input_06_01.txt').read.split("\n\n")

puts input_forms.map{|e| e.split("\n").map(&:chars).reduce(:&).size }.sum