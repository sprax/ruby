#!/usr/bin/ruby
# Sprax Lines

def prime?(num)
    if num < 2
        return false
    end
    maxfac = Math.sqrt(num+1).to_i
    for j in 2..maxfac
        if num % j == 0
            return false
        end
    end
    return true
end

