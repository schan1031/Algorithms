require 'byebug'

class DynamicProgramming

  def initialize
    @blair_cache = { 1 => 1, 2 => 2 }
    @frog_cache = { 1 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
  end

  def blair_nums(n)
    return @blair_cache[n] unless @blair_cache[n].nil?

    n_odd = (n - 1)*2 - 1
    blair = blair_nums(n - 1) + blair_nums(n - 2) + n_odd
    @blair_cache[n] = blair
    return blair

  end

  def frog_hops_bottom_up(n)
    cache = frog_cache_builder(n)
    cache[n]
  end

  def frog_cache_builder(n)
    cache = { 1 => [[1]], 2 => [[1, 1], [2]], 3 => [[1, 1, 1], [1, 2], [2, 1], [3]] }
    return cache if n < 4
    tmp = []
    (4..n).each do |i|
      cache[i - 1].each do |comb|
        comb = comb.dup
        tmp << comb.concat([1])
      end
      cache[i - 2].each do |comb|
        comb = comb.dup
        tmp << comb.concat([2])
      end
      cache[i - 3].each do |comb|
        comb = comb.dup
        tmp << comb.concat([3])
      end
      cache[i] = tmp
      tmp = []
    end
    return cache
  end

  def frog_hops_top_down(n)
    frog_hops_top_down_helper(n)

  end

  def frog_hops_top_down_helper(n)
    return @frog_cache[n] unless @frog_cache[n].nil?
    tmp = []
    frog_hops_top_down(n-1).each do |comb|
      comb = comb.dup
      tmp << comb.concat([1])
    end
    frog_hops_top_down(n-2).each do |comb|
      comb = comb.dup
      tmp << comb.concat([2])
    end
    frog_hops_top_down(n-3).each do |comb|
      comb = comb.dup
      tmp << comb.concat([3])
    end
    @frog_cache[n] = tmp

  end

  def super_frog_hops(n, k)

  end

  def knapsack(weights, values, capacity)

  end

  # Helper method for bottom-up implementation
  def knapsack_table(weights, values, capacity)

  end

  def maze_solver(maze, start_pos, end_pos)
  end
end
