require 'benchmark'
require 'colorize'

limit = ARGV[0].to_i

puts "Quick Sort with Insertion Optimisation\n".bold

def insertion_sort(array)
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
  array
end

def median_of_three(array)
  first = array[0]
  middle = (array.length / 2.0).round
  last = array[-1]
end

def recurse_sort(array)
  return array if array.length <= 1
  pivot = array[rand(array.length-1)]

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

  left = left.length <= 10 ? insertion_sort(left) : recurse_sort(left)
  right = right.length <= 10 ? insertion_sort(right) : recurse_sort(right)
  array = left + [pivots] + right
end

puts Benchmark.measure {
  array = []
  limit.times { array << rand(limit) }

  recurse_sort(array)
}

