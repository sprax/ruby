#!/usr/bin/env ruby
# Ruby script using loops
# that would be trapped by a histogram.

def main_loops()

    histogram = [-1, 2, 32, -4, 4, 44, 2, 38, 0]
    length = histogram.length;

    puts "for j in 0 ... length:";
    for j in (0...length)	# same syntax works in Python
        print(" ", histogram[j])
    end

    puts "\n\nNow backwards downto:";
    length.downto(0) do |j|
        print(" ", histogram[j])
    end

    puts "\n\nBackwards range.to_a.reverse:";
    for j in (0...length).to_a.reverse do
        print(' ', histogram[j])
    end

    puts "\n\nBackwards until:";
    j = length;
    begin
        j = j - 1;
        printf(" %d", histogram[j])
    end until j == 0

    puts "\n\nBackwards while:";
    j = length - 1;
    while (j >= 0) do
        print(" ", histogram[j])
        j -= 1;
    end

    puts "\n\n4.times do:"
    4.times do
        print " a"
    end
    puts

end

def main()
    main_loops()
end

main
