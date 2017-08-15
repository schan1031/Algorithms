require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @count += 1
    if @count > num_buckets
      resize!
      @store[key.hash % num_buckets].push(key)
    else
      @store[key.hash % num_buckets].push(key)
    end
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    @store[key.hash % num_buckets].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    out = Array.new(num_buckets * 2) { Array.new }
    @store.each do |arr|
      arr.each do |el|
        out[el % out.length].push(el)
      end
    end
    @store = out
  end
end
