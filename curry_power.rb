#!/user/bin/env ruby

power_function = -> (x, z) {
    (x) ** z
}


base = ARGV[0].to_i || 2
power = ARGV[1].to_i || 10

raise_to_power = power_function.curry.(base)
puts raise_to_power.(power)
