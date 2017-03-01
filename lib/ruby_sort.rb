require 'benchmark'
require 'colorize'

puts "Ruby Sort Algorithm\n".bold
puts Benchmark.measure {
  array = []
  10000.times { array << rand(1000) }

  array.sort!
}
