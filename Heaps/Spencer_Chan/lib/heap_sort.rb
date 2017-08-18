require_relative "heap"

class Array
  def heap_sort!

    heap = BinaryMinHeap.new

    self.each do |el|
      heap.push(el)
    end

    out = []
    until heap.count == 0
      out << heap.extract
    end

    self.replace(out)
    # out.each_index do |idx|
    #   self[idx] = out[idx]
    # end

  end
end
