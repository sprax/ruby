#!/usr/bin/ruby
#
# Sprax Lines       2007 ?
# matrix algorithm
 
require 'matrix'

FIB_MATRIX = Matrix[[1,1],[1,0]]
def fib_matrix(n)
    (FIB_MATRIX**(n-1))[0,0]
end

count = 36
if ARGV.length > 0
    count = ARGV[0].to_i
end

puts "First #{count} Fibonacci numbers using matrix multiplication:"
count.times do |i|
    f = fib_matrix(i)
    printf "%3d  %d\n", i, f 
end

