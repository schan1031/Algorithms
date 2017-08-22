# Given an Array of tuples, where tuple[0] represents a package id,
# and tuple[1] represents its dependency, determine the order in which
# the packages should be installed. Only packages that have dependencies
# will be listed, but all packages from 1..max_id exist.

# N.B. this is how `npm` works.

# Import any files you need to

require_relative 'graph'
require_relative 'topological_sort'

def install_order(arr)

  vertices = []
  out = []
  max = 0
  arr.each do |package|
    max = package[0] if package[0] > max

  end

  [*1..max].each do |val|
    vertices << Vertex.new(val)
  end

  arr.each do |package|
    Edge.new(vertices[package[1] - 1], vertices[package[0] - 1])
  end

  topological_sort(vertices).each { |v| out << v.value }
  out

end
