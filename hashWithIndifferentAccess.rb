

# In Rails, the params hash is actually a HashWithIndifferentAccess
# rather than a standard ruby Hash object. This allows you to use either
# strings like 'action' or symbols like :action to access the contents.

# You will get the same results regardless of what you use, but keep in mind
# this only works on HashWithIndifferentAccess objects.

# If you need to determine if a parameter is given, be sure to use
params.has_key?
# rather than
params.keys.include?
# as the former will return correctly for either symbol or strings
# but the latter will return false for symbols. – spyle Oct 27 '14 at 19:36

# Otherwise:

hs = { "strk" => "stork", :symk => "symbol" } # => {"strk"=>"stork", :symk=>"symbol"}
hs['strk'] #=> "stork"
hs[:strk] # => nil
hs[:symk] # => "symbol"
hs["symk"] # => nil
