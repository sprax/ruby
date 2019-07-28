#!/usr/bin/env ruby

require 'date'

# tsn = 1488352040
tsn = Time.now

dt1 = Time.at(tsn).to_datetime
puts "fixnum(#{tsn}) => LTZ date #{dt1}"

tss = tsn.to_s
dt2 = DateTime.strptime(tss,'%s')
puts "string(#{tss}) => UTC date #{dt2}"


dsz = "2017-03-01T00:00:00Z"
dtm = DateTime.rfc3339(dsz).to_time
puts "rfc3339.to_time(#{dsz}) => #{dtm}"

tsz = dtm.to_i
puts "rfc3339 date string(#{dsz}) => Unix timestamp #{tsz}"

