require 'benchmark'
require 'colorize'

puts "Bubble Sort Algorithm\n".bold
puts "Sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps"
puts "through the list to be sorted, compares each pair of adjacent items and swaps them if they"
puts "are in the wrong order.\n"

puts Benchmark.measure {
  array = []
  10000.times { array << rand(10000) }

  sorted = false
  until sorted
    sorted = true
    (0...array.length).each do |i|
      res = array[i] <=> array[i+1]
      if res == 1
        array[i], array[i+1] = array[i+1], array[i]
        sorted = false
      end
    end
  end
}
