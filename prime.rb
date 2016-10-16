#!/usr/bin/ruby
# Sprax Lines

def prime?(num)
    if num < 2
        return false
    elsif num == 2
	return true
    end
    maxfac = Math.sqrt(num).to_i + 1
    for j in 2..maxfac
        if num % j == 0
            return false
        end
    end
    return true
end

num = ARGV[0].to_i || 7
puts "is #{num} prime? ", prime?(num)
