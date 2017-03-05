require 'benchmark'
require 'colorize'
require 'pry'

# Quicksort is a divide and conquer algorithm. Quicksort first divides a large array into two smaller sub-arrays: the low elements and the high elements. 
# Quicksort can then recursively sort the sub-arrays.

# The steps are:

# Pick an element, called a pivot, from the array.
# Partitioning: reorder the array so that all elements with values less than the pivot come before the pivot,
# while all elements with values greater than the pivot come after it (equal values can go either way).
# After this partitioning, the pivot is in its final position. This is called the partition operation.

# Recursively apply the above steps to the sub-array of elements with smaller values and separately to the sub-array of elements with greater values.
# The base case of the recursion is arrays of size zero or one, which never need to be sorted.

# The pivot selection and partitioning steps can be done in several different ways; the choice of specific implementation schemes greatly affects the algorithm's performance.

limit = ARGV[0].to_i

def recurse_sort(array)
  return array if array.length <= 1
  middle = (array.length / 2.0).round
  pivot = array.slice!(middle)

  left = []
  right = []
  array.each do |e|
    if e <= pivot
      left << e
    elsif e >= pivot
      right << e
    else
      left << e
    end
  end
  left = recurse_sort(left)
  right = recurse_sort(right)
  array = left + [pivot] + right
end

puts Benchmark.measure {
  array = []
  limit.times { array << rand(limit) }

  recurse_sort(array)
}

