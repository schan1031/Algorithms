require_relative 'heap'

def k_largest_elements(array, k)
  heap = BinaryMinHeap.new

  # prc = Proc.new { |el1, el2| -1 * (el1 <=> el2) }

  array.each do |el|
    heap.push(el)
  end

  diff = heap.count - k
  out = []

  # k.times do |el|
  #   out << heap.extract
  # end

  until heap.count == 0
    if heap.count <= k
      out << heap.extract
    else
      heap.extract
    end
  end

  return out

end
