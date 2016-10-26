#!/bin/ruby

n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
    a_t = gets.strip
    a[a_i] = a_t.split(' ').map(&:to_i)
end

sum = 0
for j in (0...n)
    sum += a[j][j] - a[j][n-1-j]
end
if sum < 0
    sum = -sum
end
puts sum

