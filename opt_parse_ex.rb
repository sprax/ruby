require 'optparse'

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: #{$0} [options]"

  opts.on("-n", "--number", "Run numberously") do |v|
    options[:verbose] = v
  end

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
end.parse!

puts "$0            : #{$0}"
puts "__FILE__      : #{__FILE__}"
puts "$PROGRAM_NAME : #{$PROGRAM_NAME}"

print "opts: "
p options
print "ARGV: "
p ARGV


name = ARGV[0] || "Dave"

p "Hello #{name}!"
