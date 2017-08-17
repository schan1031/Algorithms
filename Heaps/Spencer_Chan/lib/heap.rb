require 'byebug'

class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
  end

  def count
    @store.length
  end

  def extract
    @store[0], @store[count - 1] = @store[count - 1], @store[0]
    val = @store.pop
    BinaryMinHeap.heapify_down(@store, 0)
    return val
  end

  def peek
    raise 'Out of bounds' if @store.empty?
    @store[0]
  end

  def push(val, &prc)

    if !prc
      prc = Proc.new do |el1, el2|
        el1 <=> el2
      end
    end

    @store.push(val)
    BinaryMinHeap.heapify_up(@store, count - 1,)
  end

  public
  def self.child_indices(len, parent_index)
    c1 = parent_index*2 + 1
    c2 = parent_index*2 + 2
    return [c1, c2] if len > c2
    return [c1] if len == c2
    return nil if len <= c1
  end

  def self.parent_index(child_index)
    raise 'root has no parent' if child_index == 0
    return (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    if !prc
      prc = Proc.new do |el1, el2|
        el1 <=> el2
      end
    end

    children = BinaryMinHeap.child_indices(len, parent_idx)
    return unless children
    if children.length == 2
      case prc.call(array[children[0]], array[children[1]])
      when -1
        min_ind = children[0]
      when 0
        min_ind = children[0]
      when 1
        min_ind = children[1]
      end
      # min_ind = array[children[0]] <= array[children[1]] ? children[0] : children[1]
    elsif children.length == 1
      min_ind = children[0]
    end

    case prc.call(array[parent_idx], array[min_ind])
    when -1
      return
    when 0
      return
    when 1
      array[parent_idx], array[min_ind] = array[min_ind], array[parent_idx]
      self.heapify_down(array, min_ind, len, &prc)
      return array
    end
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)

    return if len == 1 || len == 0

    if !prc
      prc = Proc.new do |el1, el2|
        el1 <=> el2
      end
    end

    parent = BinaryMinHeap.parent_index(child_idx)

    return unless parent

    case prc.call(array[child_idx], array[parent])
    when -1
      # byebug
      array[child_idx], array[parent] = array[parent], array[child_idx]
      self.heapify_up(array, parent, len, &prc) unless parent == 0
      return array
    when 0
      return
    when 1
      return
    end

  end
end
