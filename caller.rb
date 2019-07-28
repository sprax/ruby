
class Calls
  def self.putter(num)
    puts("Calls.putter: ", num)
  end

  # Use Calls.method(:putter) or self.method(:putter)
  def self.caller(num, meth = self.method(:putter))
    meth.call(num)
  end
end

