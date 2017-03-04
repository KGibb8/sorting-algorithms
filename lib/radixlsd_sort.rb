require 'benchmark'
require 'colorize'

puts "Radix - Least Significant Digit Sort\n".bold

puts Benchmark.measure {
  array = []
  10000.times { array << rand(10000) }

  mod = 10
  n = 1
  loop do
    buckets = { 0 => [], 1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [] }
    (0...array.length - 1).each do |i|
      position = (array[i] % mod) / n
      buckets[position] << array[i]
    end

    array = buckets.values.flatten
    break if array.max / mod <= 1
    mod *= 10
    n *= 10
  end
}
