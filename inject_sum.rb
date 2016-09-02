
def sum_terms(n)
    (1..n).inject(0) {|sum, k| sum + k*k + 1 }
end

