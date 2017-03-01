require 'colorize'
require 'benchmark'

puts "Merge Sort Algorithm\n".bold

def sort_two(left, right)
  array = []
  l = 0
  r = 0
  loop do
    # Exit loop if end of both arrays has been reached
    break if l >= left.length && r >= right.length
    # If right array is finished OR (left array isnt finished AND left is less than right)
    if r >= right.length || (l < left.length && left[l] < right[r])
      array << left[l]
      l += 1
    else
      array << right[r]
      r += 1
    end
  end
  array
end

def recursive_split(array)
  # Break out of recursion if array length is 1
  return array if array.length <= 1
  # Slice array in half
  halves = array.each_slice((array.length/2.0).round).to_a
  # Recurse with new array
  left = recursive_split(halves[0])
  right = recursive_split(halves[1])
  # Perform sort action on results
  sort_two(left, right)
end

puts 'Uses recursion to split the array in half until left with only one item'
puts 'For each leaf node, the numbers are sorted by comparing one at at time between each array'
puts 'The smaller value is shovelled into the returned results, the index incremented and then checked again'
puts "Each returned array is then recompared with the next \"batch\"\n"

puts Benchmark.measure {
  array = []
  10000.times{ array << rand(10000) }
  recursive_split(array)
}
