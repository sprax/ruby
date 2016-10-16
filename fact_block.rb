#!/usr/bin/env ruby
# N pick K, or (N K), aka nCr, implemented with a partial application

def factorial
    yield
end

n = ARGV[0].to_i || 7
factorial do 
    puts (1..n).inject(:*) || 1
end

