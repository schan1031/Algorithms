# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length)
    self.length = length
    self.data = []
  end

  # O(1)
  def [](index)
    self.data[index]
  end

  # O(1)
  def []=(index, value)
    self.data[index] = value
  end

  protected
  attr_accessor :store
end
