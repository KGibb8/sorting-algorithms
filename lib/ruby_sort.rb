require 'benchmark'
require 'colorize'

limit = ARGV[0].to_i

puts "Ruby Sort Algorithm\n".bold
puts Benchmark.measure {
  array = []
  limit.times { array << rand(limit) }

  array.sort!
}
