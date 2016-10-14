
# Your code here
def convert_temp(u, input_scale: 'celsius', output_scale: 'celsius')
  case input_scale
  when 'celsius'
    output_scale == 'kelvin' ? u + 273.15 : (u * (9/5.0)) + 32
  when 'kelvin'
    output_scale == 'fahrenheit' ? u * 5.0/9.0 + 32 + 273.15 :  u - 273.15
  when 'fahrenheit'
    output_scale == 'celsius' ? (u - 32) * (5.0/9.0)  :  (u - 32) * 5.0/9.0 + 273.15
  end
end

