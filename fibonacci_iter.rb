#!/usr/bin/ruby
#
# Sprax Lines       2007 ?
# iterative addition

def fib_it(n)
	return n if n < 2
	fibNow = 0
	fibNxt = 1
	n.times do |j|
		fibNow, fibNxt = fibNxt, fibNow + fibNxt
	end
	return fibNow
end

count = 36
if ARGV.length > 0
	count = ARGV[0].to_i
end

puts "First #{count} Fibonacci numbers using iteration:"
count.times do |i|
	f = fib_it(i)
	printf "%3d  %d\n", i, f 
end

