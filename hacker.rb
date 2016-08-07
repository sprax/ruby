# Ruby script using loops

def element_at(arr, index)
    # return the element of the Array variable `arr` at the position `index`
    # arr.at(index) # or
    arr[index]
end

def inclusive_range(arr, start_pos, end_pos)
    # return the elements of the Array variable `arr` between the start_pos and end_pos (both inclusive)
    arr[start_pos..end_pos]
end

def non_inclusive_range(arr, start_pos, end_pos)
    # return the elements of the Array variable `arr`, start_pos inclusive and end_pos exclusive
    arr[start_pos...end_pos]
end

def start_and_length(arr, start_pos, length)
    # return `length` elements of the Array variable `arr` starting from `start_pos`
    arr[start_pos, length]
end

def neg_pos(arr, index)
    # return the element of the array at the position `index` from the end of the list
    arr[-index]
end

def first_element(arr)
    # return the first element of the array
    arr.first
end

def last_element(arr)
    # return the last element of the array
    arr.last
end

def first_n(arr, n)
    # return the first n elements of the array
    arr.take(n)
end

def drop_n(arr, n)
    # drop the first n elements of the array and return the rest
    arr.drop(n)
end

def end_arr_add(arr, element)
    # Add `element` to the end of the Array variable `arr` and return `arr`
    arr.push(element)
end

def begin_arr_add(arr, element)
    # Add `element` to the beginning of the Array variable `arr` and return `arr`
    arr.unshift(element)
end

def index_arr_add(arr, index, element)
    # Add `element` at position `index` to the Array variable `arr` and return `arr`
    arr.insert(index, element)
end

def index_arr_multiple_add(arr, index)
    # add any two elements to the arr at the index
    arr.insert(index, 1, 2)
end

def select_arr(arr)
  # select and return all odd numbers from the Array variable `arr`
    arr.select {|a| a % 2 == 1}
end

def reject_arr(arr)
  # reject all elements which are divisible by 3
    arr.reject {|a| a % 3 == 0}    
end

def delete_arr(arr)
  # delete all negative elements
    arr.delete_if {|a| a < 0}
end

def keep_arr(arr)
  # keep all non negative elements ( >= 0)
    arr.keep_if {|a| a >= 0}
end

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

