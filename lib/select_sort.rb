require 'colorize'
require 'benchmark'

puts "Selection Sort Algorithm\n".bold

puts 'Selection Sort Implementation (sorts an array by repeatedly finding the minimum element'
puts "(considering ascending order) from unsorted part and putting it at the beginning.)\n"

puts Benchmark.measure {
  array = []
  10000.times{ array << rand(10000) }

  n = array.length
  (0...n).each do |i|
    min = i
    (i+1...n-1).each do |j|
      if array[min] < array[j]
        min = j
      end
      array[min], array[j] = array[j], array[min]
    end
  end
}
