#!/usr/bin/env ruby
require 'prime'
# N = gets.to_i
N = ARGV[0].to_i || 31
p Prime.each.lazy.select{|x| x.to_s == x.to_s.reverse}.first(N)
