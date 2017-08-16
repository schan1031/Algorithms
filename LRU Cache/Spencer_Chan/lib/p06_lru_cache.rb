require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)

    if @map.include?(key)
      update_node!(@map[key])
      return @map[key].val
    else
      eject! if @map.count == @max
      val = @prc.call(key)
      @store.append(key, val)
      @map[key] = @store.last
      return val
    end

  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    node.remove
    @store.append(node.key, node.val)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.remove
  end
end
