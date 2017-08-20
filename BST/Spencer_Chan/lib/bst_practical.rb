require_relative 'binary_search_tree'

def kth_largest(tree_node, k)
  arr = BinarySearchTree.reverse_order_two(tree_node)
  return arr[k-1]
end
