#!/bin/ruby

n = gets.strip.to_i
aa = Array.new(n)
for a_i in (0..n-1)
    a_t = gets.strip
    aa[a_i] = a_t.split(' ').map(&:to_i)
end

def abs_diff_diags_1(a)
    sum = 0
    for j in (0...n)
        sum += a[j][j] - a[j][n-1-j]
    end
    if sum < 0
        sum = -sum
    end
    sum
end

def abs_diff_diags_2(a)
    sum = 0
    for j in (0...n/2)
        sum += a[j][j] - a[j][n-1-j] + a[n-1-j][n-1-j] - a[n-1-j][j]
    end
    if sum < 0
        sum = -sum
    end
    sum
end

puts abs_diff_diags_1(aa) - abs_diff_diags_2(aa)

