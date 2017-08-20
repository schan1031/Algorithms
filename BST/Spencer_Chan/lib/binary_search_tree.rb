# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.
require_relative 'bst_node'

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
  end

  def insert(value)
    if @root == nil
      @root = BSTNode.new(value)
      return
    end

    node = @root
    dir = which_way(value, node)

    while true
      if dir == 'left'
        break if node.left == nil
        node = node.left
      else
        break if node.right == nil
        node = node.right
      end
      dir = which_way(value, node)
    end

    if dir == 'left'
      node.left = BSTNode.new(value)
      node.left.parent = node
    else
      node.right = BSTNode.new(value)
      node.right.parent = node
    end

  end

  def find(value, tree_node = @root)
    node = tree_node
    dir = which_way(value, @root)

    while true
      break if node.value == value
      if dir == 'left'
        return nil if node.left == nil
        node = node.left
      else
        return nil if node.right == nil
        node = node.right
      end
      dir = which_way(value, node)
    end

    return node
  end

  def delete(value)
    target = find(value, @root)
    return nil if target == nil
    if target == @root
      @root = nil
      return
    end

    if child_count(target) == 0
      set_child(target, target.parent, nil)
    elsif child_count(target) == 1
      if target.left
        set_child(target, target.parent, target.left)
      else
        set_child(target, target.parent, target.right)
      end
    elsif child_count(target) == 2
      max = maximum(target.left)
      if child_count(max) == 0
        target.value = max.value
        set_child(max, max.parent, nil)
      else
        target.value = max.value
        set_child(max, max.parent, max.left)
        max.left.parent = max.parent
      end
    end


  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    until tree_node.right == nil
      tree_node = tree_node.right
    end
    return tree_node
  end

  def depth(tree_node = @root)
    return -1 if tree_node.nil?
    left = depth(tree_node.left)
    right = depth(tree_node.right)
    if left > right
      return left += 1
    else
      return right += 1
    end
  end

  def is_balanced?(tree_node = @root)
    depth(tree_node.right) == depth(tree_node.left)
  end

  def in_order_traversal(tree_node = @root, arr = [])
    return if tree_node.nil?
    in_order_traversal(tree_node.left, arr)
    arr << tree_node.value
    in_order_traversal(tree_node.right, arr)
    arr
  end

  def self.reverse_order_two(tree_node = @root, arr = [])
    return if tree_node.nil?
    reverse_order_two(tree_node.right, arr)
    arr << tree_node
    reverse_order_two(tree_node.left, arr)
    arr
  end


  private
  # optional helper methods go here:

  def which_way(value, node)
    if value < node.value
      return 'left'
    else
      return 'right'
    end
  end

  def only_child(node)
    if node.right
      return node.right
    else
      return node.left
    end
  end

  def child_count(node)
    count = 0
    count += 1 if node.left
    count += 1 if node.right
    return count
  end

  def rewire_max(node)
    return if node.left == nil
    node.parent.right = node.left
  end

  def set_child(node, parent, val)
    if parent.right == node
      parent.right = val
    else
      parent.left = val
    end
    if val
      val.parent = parent
    end
  end

end
