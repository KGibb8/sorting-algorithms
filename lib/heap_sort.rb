require 'benchmark'
require 'pry'

# In the first step, a heap is built out of the data.
# The heap is often placed in an array with the layout of a complete binary tree.
# The complete binary tree maps the binary tree structure into the array indices; each array index represents a node;

# A max-heap is a complete binary tree in which the value in each internal node
# is greater than or equal to the values in the children of that node.

limit = ARGV[0].to_i

# Some Hash fun
def recurse_node(index)
  node = { value: @array[index], index: index, children: [] }
  child_start_i = (2 * index) + 1
  (0..1).each do |i|
    actual_child_i = child_start_i + i
    child = @array[actual_child_i]
    if child.nil?
      @array[index] = node
      return node
    end
    if node[:value] <= child
      node[:value], child = child, node[:value]
      @array[index], @array[actual_child_i] = @array[actual_child_i], @array[index]
    end
    node[:children] << child
    actual = recurse_node(actual_child_i)
    node[:children][i] = actual
    if node[:value] <= actual[:value]
      node[:value], actual[:value] = actual[:value], node[:value]
      # @array[index], @array[actual[:index]] = @array[actual[:index]], @array[index]
    end

  end
  @array[index] = node
  node
end

# def sift_down(node)
#   node[:children].each do |child|
#     unless child.nil?
#       sift_down(child)
#       if node[:value] < child[:value]
#         node[:value], child[:value] = child[:value], node[:value]
#       end
#     end
#   end
# end

def heapify(index)
  child_start_i = (2 * index) + 1
  (0..1).each do |i|
    actual_child_i = child_start_i + i
    # If we've hit maximum recursion
    return if @array[actual_child_i].nil?
    heapify(actual_child_i)
    if @array[index] <= @array[actual_child_i]
      @array[index], @array[actual_child_i] = @array[actual_child_i], @array[index]
    end
  end
end

def sift_down(index)

end

def swap(end_of_i)
  @array[end_of_i], @array[0] = @array[0], @array[end_of_i]
end

Benchmark.bm do |bm|
  @array = []
  limit.times { @array << rand(limit) }
  end_of_i = @array.length-1
  sorted = []
  bm.report do
    until end_of_i < 0
      heapify(0)
      swap(end_of_i)
      sorted << @array.pop
      end_of_i -= 1
    end
    # puts sorted.join(', ')
  end
end
