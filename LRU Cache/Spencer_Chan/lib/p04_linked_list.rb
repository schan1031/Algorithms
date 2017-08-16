require 'byebug'

class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = Node.new

    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    return true if @tail.prev == @head
    false
  end

  def get(key)
    node = @head.next
    while node.key
      return node.val if node.key == key
      node = node.next
    end
    nil
  end

  def include?(key)
    node = @head.next
    until node == @tail
      if node.key == key
        return true
      else
        node = node.next
      end
    end
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    node.prev = @tail.prev
    @tail.prev.next = node
    @tail.prev = node
    node.next = @tail
  end

  def update(key, val)
    node = @head.next
    while node.key
      if node.key == key
        node.val = val
        return
      end
      node = node.next
    end
  end

  def remove(key)
    node = @head.next
    until node == @tail
      if node.key == key
        # byebug
        node.prev.next = node.next
        node.next.prev = node.prev
      end
      node = node.next
    end
    nil
  end

  def each(&prc)
    node = @head.next
    until node == @tail
      prc.call(node)
      node = node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
