require 'benchmark'
require 'colorize'

limit = ARGV[0].to_i

puts "Insertion Sort Algorithm\n".bold

Benchmark.bm do |bm|
  array = []
  limit.times { array << rand(limit) }
  bm.report(:insertion) do
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
  end
end
