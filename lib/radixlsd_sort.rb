require 'benchmark'
require 'colorize'

limit = ARGV[0].to_i

puts "Radix LSD (Least Significant Digit) Sort Algorithm\n".bold

Benchmark.bm do |bm|
  array = []
  limit.times { array << rand(limit) }
  bm.report(:radixlsd) do
    max = array.max
    mod = 10
    n = 1
    loop do
      buckets = { 0 => [], 1 => [], 2 => [], 3 => [], 4 => [], 5 => [], 6 => [], 7 => [], 8 => [], 9 => [] }
      (0...array.length - 1).each do |i|
        position = (array[i] % mod) / n
        buckets[position] << array[i]
      end

      array = buckets.values.flatten
      break if max / mod <= 1
      mod *= 10
      n *= 10
    end
  end
end
