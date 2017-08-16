require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  def each(&block)

  end
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def set(key, val)
    if @store[key.hash % num_buckets].include?(key)
      @store[key.hash % num_buckets].update(key, val)
    else
      if @count == num_buckets
        resize!
        @count += 1
        @store[key.hash % num_buckets].append(key, val)
      else
        @count += 1
        @store[key.hash % num_buckets].append(key, val)
      end
    end
  end

  def get(key)
    @store[key.hash % num_buckets].get(key)
  end

  def delete(key)
    if @store[key.hash % num_buckets].include?(key)
      @store[key.hash % num_buckets].remove(key)
      @count -= 1
    end
  end

  def each(&prc)
    @store.each do |el|
      el.each do |ll|
        prc.call(ll.key, ll.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    arr = []
    @store.each do |links|
      links.each do |ele|
        arr << [ele.key, ele.val]
      end
    end
    @store = Array.new(num_buckets * 2) { LinkedList.new }
    arr.each do |kv|
      self.set(kv.first, kv.last)
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
