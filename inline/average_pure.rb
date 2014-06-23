#!/usr/bin/ruby -w

# We started out with some code that averaged a ton of numbers in a
# bunch of arrays. Once we finally lost our patience with the average
# running time of the code, we decided to profile and optimize it
# using RubyInline. 

class Array

  def average
    result = 0
    self.each { |x| result += x }
    result / self.size.to_f
  end

end

max_loop = (ARGV.shift || 5).to_i
max_size = (ARGV.shift || 100_000).to_i
a = (1..max_size).to_a

1.upto(max_loop) do
  avg = a.average
  $stderr.print "."
end
$stderr.puts ""

