# Ruby script to calculate the area of "water"
# that would be trapped by a histogram. 
# Translated from a Python script, histarea.py.

# default values.  Globals prefixed by dollar sign $:
$defaultProgramName  = "histarea";
$INT_MIN = -2147483648


def histarea(histogram, length)
    # Calculates the area of "fluid" that would be trapped in poured onto
    # a histogram from above.'''

    area, height = 0, 0;
    if (length > 2)
        maxFromLeft = []
        maxHeight = $INT_MIN;
        # Don't skip the last entry.
        for j in (0...length)
            height = histogram[j]
            if (maxHeight < height)
                maxHeight = height
        end
            maxFromLeft.push(maxHeight)
    end
        maxHeight = $INT_MIN;
    length -= 1;
    length.downto(1) do |j|
        # for j in (length-1, 0, -1)   # Do skip the first entry.
            height = histogram[j]
            if (maxHeight < height)
                maxHeight = height
        end
            if (maxHeight > maxFromLeft[j]) then
                area += maxFromLeft[j] - height;
            else
                area += maxHeight - height;
        end
    end
    end
        
    return area;
end

def main_histarea()
    histogram = [-1, 2, 32, -4, 4, 44, 2, 38, 0]
    length = histogram.length;
    
    area = histarea(histogram, length);
    print("Area from histogram: ");
    puts(area);
end


# import modules
# import sys

# Gather our code in a main() function
def main()
    printf("Hello from Ruby script %s\n", $0)
    print "Begin main <" + $defaultProgramName + ">\n";

    # Command line args are in sys.argv[1], sys.argv[2] ..
    # sys.argv[0] is the script name itself and can be ignored
    main_histarea()
end

main

