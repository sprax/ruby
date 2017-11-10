
class Calls
  def self.putter(num)
    puts("Calls.putter: ", num)
  end

  def self.caller(num, meth = Calls.method(:putter))
    meth.call(num)
  end
end
