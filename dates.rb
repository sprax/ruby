#!/usr/bin/env ruby

require 'date'

tsn = 1488352040

dt1 = Time.at(tsn).to_datetime
puts "fixnum(#{tsn}) => LTZ date #{dt1}"

tss = tsn.to_s
dt2 = DateTime.strptime(tss,'%s')
puts "string(#{tss}) => UTC date #{dt2}"


