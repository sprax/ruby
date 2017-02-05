def const_var_name(str)
  str.split.map { |i| i.capitalize }.join('_')
end

def format_val(val, nil_val='')
  case val
  when String
    "\"#{val}\""
  when NilClass
    "\"#{nil_val}\""
  else
    val
  end
end

def pp_key_val(hh, key)
  puts "  :#{key} => #{format_val(hh[key])},"
end

def pp_hash(hh)
  for key in hh.keys do
    pp_key_val(hh, key)
  end
end

def pp_org_stats(hh)
  puts "#{const_var_name(hh[:name])}_stats = {"
  pp_hash(hh)
  puts "}\n"
end
