#!/usr/bin/ruby
# From: http://www.dotnetperls.com/2d-ruby
#
# This 2D array contains two sub-arrays.
values = Array[[10, 20, 30], [40, 50, 60]]

# Loop over each row array.
values.each do |x|

    # Loop over each cell in the row.
    x.each do |cell|
	print " " , cell
    end

    # End of row.
    puts
end

values = []

# Create first row.
subarray = []
subarray.push(1)
subarray.push(2)
subarray.push(3)

# Add first row.
values.push(subarray)

# Create second row.
subarray = []
subarray.push(10)
subarray.push(20)
subarray.push(30)

# Add second row.
values.push(subarray)

# Load an element.
puts "Third element in first row is: " << String(values[0][2])

# Change this element.
values[1][1] = 500

# Display all elements.
values.each do |x|
    x.each do |y|
	print " " , y
    end
    puts
end
