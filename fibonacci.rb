#!/usr/bin/ruby
#
# Sprax Lines       2007 ?
# naive recursion

def fib_rec(n)
  return n if (0..1).include? n
  fib_rec(n-1) + fib_rec(n-2) if n > 1
end

count = 36
if ARGV.length > 0
  count = ARGV[0].to_i
end

puts "First #{count} Fibonacci numbers using naive recursion:"
count.times do |i|
  f = fib_rec(i)
  printf "%3d  %d\n", i, f 
  # same as: # puts "#{i}  #{f}"
end

