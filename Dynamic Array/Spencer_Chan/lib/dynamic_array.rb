require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @capacity = 8
    @length = 0
    @store = Array.new(@capacity)
  end

  # O(1)
  def [](index)
    if index >= @length || @store.empty?
      raise 'index out of bounds'
    end
    @store[index]
  end

  # O(1)
  def []=(index, value)
    if index > @length
      raise 'index out of bounds'
    end
    @store[index] = value
  end

  # O(1)
  def pop
    if @length == 0
      raise 'index out of bounds'
    end
    @length -= 1
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    if @length == @capacity
      self.resize!
    end

    self[@length] = val
    @length += 1
  end

  # O(n): has to shift over all the elements.
  def shift
    if @length == 0
      raise 'index out of bounds'
    end
    @store = @store[1..-1]
    @length -= 1
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    if @length == @capacity
      self.resize!
    end

    out = [val]
    @store.each do |el|
      out << el
    end
    @length += 1
    @store = out
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    out = Array.new(@capacity)
    @store.each_index do |idx|
      out[idx] = @store[idx]
    end
    @store = out
  end
end
