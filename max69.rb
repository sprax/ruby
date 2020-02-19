#!/usr/bin/env ruby
# Ruby script to calculate the area of "water"
# that would be trapped by a histogram. 
# Translated from a Python script, histarea.py.

# default values.  Globals prefixed by dollar sign $:
$defaultProgramName  = "histarea";
$INT_MIN = -2147483648

# @param {Integer} num
# @return {Integer}
def maximum69_number (num)
    s = num.to_s
    t = s.sub('6', '9')
    t.to_i
end


def main_69()
    num = maximum69_number(9669);
    puts(num);
end


# import modules
# import sys

# Gather our code in a main() function
def main()
    printf("Hello from Ruby script %s\n", $0)
    print "Begin main <" + $defaultProgramName + ">\n";

    # Command line args are in sys.argv[1], sys.argv[2] ..
    # sys.argv[0] is the script name itself and can be ignored
    main_69()
end

main

