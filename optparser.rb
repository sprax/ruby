require 'optparse'

Options = Struct.new(:name)

class Parser
  def self.parse(options)
    args = Options.new("world")

    opt_parser = OptionParser.new do |opts|
      opts.banner = "Usage: example.rb [options]"

      opts.on("-nNAME", "--name=NAME", "Name to say hello to") do |n|
        args.name = n
      end

      opts.on("-h", "--help", "Prints this help") do
        puts opts
        exit
      end
    end

    opt_parser.parse!(options)
    return args
  end
end
options = Parser.parse %w[--help]

print "options:"
puts   options

#=>
   # Usage: example.rb [options]
   #     -n, --name=NAME                  Name to say hello to
   #     -h, --help                       Prints this help
