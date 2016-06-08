# Ruby script using loops
# that would be trapped by a histogram. 

def main_loops()

    histogram = [-1, 2, 32, -4, 4, 44, 2, 38, 0]
    length = histogram.length;
    
    for j in (0...length)	# same syntax works in Python
        puts( histogram[j])
    end

    puts "\nNow backwards downto:";
    length.downto(0) do |j|
        puts( histogram[j])
    end

    puts "\nBackwards range.to_a.reverse:";
    for j in (0...length).to_a.reverse do
        puts( histogram[j])
    end

    puts "\nBackwards until:";
    j = length;
    begin
	j = j - 1;
        puts( histogram[j])
    end until j == 0

    puts "\nBackwards while:";
    j = length - 1;
    while (j >= 0) do
        puts( histogram[j])
	j -= 1;
    end

end

def main()
    main_loops()
end

main

