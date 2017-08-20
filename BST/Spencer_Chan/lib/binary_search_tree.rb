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
    else
      node.right = BSTNode.new(value)
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

    

  end

  # helper method for #delete:
  def maximum(tree_node = @root)
    until tree_node.right == nil
      tree_node = tree_node.right
    end
    return tree_node
  end

  def depth(tree_node = @root)
  end

  def is_balanced?(tree_node = @root)
  end

  def in_order_traversal(tree_node = @root, arr = [])
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

  def find_parent(value, tree_node = @root)
    node = tree_node
    node2 = node
    dir = which_way(value, @root)

    while true
      break if node.value == value
      node2 == node
      if dir == 'left'
        break if node.left == nil
        node = node.left
      else
        break if node.right == nil
        node = node.right
      end
      dir = which_way(value, node)
    end
    return 'root node' if node2 == parent
    return node2
  end

  def rewire_max(node)
    return if node.left == nil
    parent = find_parent(node)
    if parent.right == node
      parent.right == node.left
    end
    nil
  end

end
