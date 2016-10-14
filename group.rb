#!/usr/bin/env ruby

def group_by_marks(marks, n) 
    marks.group_by {|k,v| (v >= n && !k.nil?)? "Passed" : "Failed" } 
end

