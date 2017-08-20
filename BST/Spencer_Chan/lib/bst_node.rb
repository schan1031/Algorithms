class BSTNode
  attr_accessor :left, :right, :value, :parent
  def initialize(value)
    @parent = nil
    @left = nil
    @right = nil
    @value = value
  end
end
