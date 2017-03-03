require 'benchmark'
require 'colorize'

puts "Insertion Sort Algorithm\n".bold

puts Benchmark.measure {

  array = []
  10000.times { array << rand(10000) }

  l = array.length
  (0...l-1).each do |i|
    pos = i
    n = pos + 1
    while n >= 0 && array[pos] > array[n]
      array[pos], array[n] = array[n], array[pos]
      pos -= 1
      n -= 1
    end
  end

}

