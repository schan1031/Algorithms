require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    @capacity = 8
    @count = 0
    @store = Array.new(8)
    @start_idx = 0
    @length = @count - @start_idx
  end

  # O(1)
  def [](index)
    if index >= @length || @store.empty?
      raise 'index out of bounds'
    end
    @store[(@start_idx % @capacity + index) % @capacity]
  end

  # O(1)
  def []=(index, val)
    if index > @length
      raise 'index out of bounds'
    end
    @store[@start_idx % @capacity + index] = val
  end

  # O(1)
  def pop
    if @length == 0
      raise 'index out of bounds'
    end
    @count -= 1
    out = @store[@count]
    @length = @count - @start_idx
    return out
  end

  # O(1) ammortized
  def push(val)
    if @length == @capacity
      self.resize!
    end

    @store[@count] = val
    @count += 1
    @length = @count - @start_idx
  end

  # O(1)
  def shift
    if @length == 0
      raise 'index out of bounds'
    end
    out = @store[@start_idx]
    @start_idx += 1
    @length = @count - @start_idx
    return out
  end

  # O(1) ammortized
  def unshift(val)
    if @length == @capacity
      self.resize!
    end
    @start_idx -= 1
    @store[@start_idx % @capacity] = val
    @length = @count - @start_idx
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
    @capacity *= 2
    out = Array.new(@capacity)
    (0...length).each do |idx|
      out[idx] = @store[(start_idx % (@capacity / 2) + idx) % (@capacity / 2)]
    end
    @store = out
    @start_idx = 0
    @count = 8
  end
end
