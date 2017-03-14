require 'benchmark'
require 'colorize'

limit = ARGV[0].to_i

puts "Ruby Sort Algorithm\n".bold
Benchmark.bm do |bm|
  array = []
  limit.times { array << rand(limit) }
  bm.report(:ruby) do
    array.sort!
  end
end
