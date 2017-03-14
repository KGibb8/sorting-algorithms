require 'benchmark'
require 'colorize'

limit = ARGV[0].to_i

puts "Quick Sort Algorithm\n".bold

puts "Select a pivot from the middle of the array"
puts "Sort to left or right relative to comparison with pivot"
puts "Recurse with sorted array to base case when array is less than or equal to 1"
puts "Return sorted arrays with pivot nested in centre\n\n"

def recurse_sort(array)
  return array if array.length <= 1
  middle = (array.length / 2.0).round
  pivot = array.slice!(middle)

  left = []
  right = []
  pivots = [pivot]
  array.each do |e|
    if e <= pivot
      left << e
    elsif e >= pivot
      right << e
    else
      pivots << e
    end
  end
  left = recurse_sort(left)
  right = recurse_sort(right)
  array = left + pivots + right
end

Benchmark.bm do |bm|
  array = []
  limit.times { array << rand(limit) }
  bm.report(:quick) do
    recurse_sort(array)
  end
end
