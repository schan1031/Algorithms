require_relative 'graph'

# Implementing topological sort using both Khan's and Tarian's algorithms

def topological_sort(vertices)
  sorted = []
  visited = []
  top = []
  vertices.each do |vertex|
    if vertex.in_edges.empty?
      top.push(vertex)
    end
  end

  # cyclic check
  top.each do |vertex|
    node = vertex
    node.out_edges.each do |edge|

    end
  end

  return top if top.empty?

  until top.empty?
    current = top.shift
    sorted << current
    current.out_edges.each do |edge|
      edge.to_vertex.in_edges.delete(edge)
      if edge.to_vertex.in_edges.empty?
        top.push(edge.to_vertex)
      end
    end
  end
  return [] if sorted.length < vertices.length
  sorted
end

def tarjan_sort
  
end
