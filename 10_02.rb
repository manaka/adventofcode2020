#!/usr/bin/env ruby
# frozen_string_literal: true

input_jolts = File.open('input_10_01.txt').read.split("\n").map(&:to_i).sort!

hsh = {0 => 1}
input_jolts.each do |el|
  hsh[el] = ([hsh[el-1], hsh[el-2], hsh[el-3]] - [nil]).sum
end

p hsh.values.last