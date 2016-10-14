
def full_name(first, *rest)
	rest.reduce(first){|o, x| o + " " + x}
end

def full_name first, second, *rest
	first += " " + second
	rest.reduce(first){|o, x| o + " " + x}
end
