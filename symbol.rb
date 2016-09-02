
require 'benchmark'

n = 1_000_000

print '"foo".equal? "foo" -> ', ("foo".equal? "foo"), "\n"
print '"foo" == "foo"     -> ', ("foo" == "foo"    ), "\n"
print ':foo.equal? :foo   -> ', (:foo.equal? :foo  ), "\n"
print ':foo == :foo       -> ', (:foo == :foo      ), "\n"

Benchmark.bm(10) do |b|
  b.report('string')     { n.times { "foo".equal? "foo" }}
  b.report('str == str') { n.times { "foo" == "foo"     }}
  b.report('symbol')     { n.times { :foo.equal? :foo   }}
  b.report('sym == sym') { n.times { :foo == :foo       }}
end


