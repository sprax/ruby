#!/usr/bin/env ruby
#
def transcode(str)
    str.force_encoding(Encoding::UTF_8)
end

str = ARGV[0] || "With ?!"
puts transcode(str)

