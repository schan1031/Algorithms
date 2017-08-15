# Implement a queue with #enqueue and #dequeue, as well as a #max API,
# a method which returns the maximum element still in the queue. This
# is trivial to do by spending O(n) time upon dequeuing.
# Can you do it in O(1) amortized? Maybe use an auxiliary storage structure?

# Use your RingBuffer to achieve optimal shifts! Write any additional
# methods you need.

require_relative 'ring_buffer'

class QueueWithMax
  attr_accessor :store

  def initialize
    @store = RingBuffer.new
    @max_arr = RingBuffer.new
  end

  def enqueue(val)
    @store.push(val)
    if @store.length == 0
      @max_arr.push(val)
    else
      until @max_arr.length == 0 || val <= @max_arr.last
        @max_arr.pop
      end
      @max_arr.push(val)
    end
  end

  def dequeue
    val = @store.shift
    if val == @max_arr.first
      @max_arr.shift
    end
  end

  def max
    @max_arr.first
  end

  def length
    @store.length
  end

end
