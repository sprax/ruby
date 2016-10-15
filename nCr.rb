#!/usr/bin/env ruby
# N pick K, or (N K), aka nCr, implemented with a partial application

combination = -> (n) do
    -> (r) do
        m = n - r + 1
        num = (m..n).inject(:*) || 1
        den = (1..r).inject(:*) || 1
        num/den
    end
end

n = gets.to_i
r = gets.to_i
nCr = combination.(n)
puts nCr.(r)
