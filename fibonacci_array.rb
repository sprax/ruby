#!/usr/bin/ruby
#
# Sprax Lines
# dynamic programming with array

# The following functions are equivalent.
# I prefer the first one, fib_array1.

def fib_array1(n)
    return n if n < 2
    array = [0]
    f = 1
    n.times do
        array.push(f)
        f = f + array[-2]
    end
    return array.last
end

def fib_array2(n)
    return n if n < 2
    array = [0, 1]
    (n - 1).times do
        array.push(array[-1] + array[-2])
    end
    return array.last
end

count = 36
if ARGV.length > 0
    count = ARGV[0].to_i
end

puts "First #{count} Fibonacci numbers using dynamic array:"
count.times do |i|
    f = fib_array1(i)
    printf "%3d  %d\n", i, f 
end

