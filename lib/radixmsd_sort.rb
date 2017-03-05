require 'benchmark'
require 'colorize'

limit = ARGV[0].to_i

puts "Radix MSD (Most Significant Digit) Sort Algorithm".bold

def recurse_sort(array, divisor)
  buckets = { 0 => [], 1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [] }
  (0...array.length - 1).each do |i|
    position = (array[i] / divisor) % 10
    buckets[position] << array[i]
  end
  divisor /= 10
  return buckets.values.flatten if divisor == 0
  results = []
  buckets.each do |n, a|
    results << recurse_sort(a, divisor)
  end
  results.flatten
end

puts Benchmark.measure {
  array = []
  limit.times { array << rand(limit) }

  max = array.max
  divisor = 10 ** ((max.to_s.split('').count) - 1)
  recurse_sort(array, divisor)
}

