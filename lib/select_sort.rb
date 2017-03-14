require 'colorize'
require 'benchmark'

limit = ARGV[0].to_i

puts "Selection Sort Algorithm\n".bold

puts 'Selection Sort Implementation (sorts an array by repeatedly finding the minimum element'
puts "(considering ascending order) from unsorted part and putting it at the beginning.)\n"

Benchmark.bm do |bm|
  array = []
  limit.times{ array << rand(limit) }
  bm.report(:select) do
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
  end
end
