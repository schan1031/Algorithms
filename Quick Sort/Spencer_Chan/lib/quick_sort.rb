class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.count <= 1

    len = array.count
    mid = len / 2

    left = array.select { |el| el < array[mid] }
    right = array.select { |el| el > array[mid] }

    return QuickSort.sort1(left) + [array[mid]] + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    prc ||= Proc.new {|x, y| x <=> y}

    return array if length <= 1

    pivot_ind = QuickSort.partition(array, start, length, &prc)
    left = pivot_ind - start
    right = length - left - 1
    QuickSort.sort2!(array, start, left, &prc)
    QuickSort.sort2!(array, pivot_ind + 1, right, &prc)

    return array

  end

  def self.partition(array, start, length, &prc)

    return if array.length <= 1

    pivot = 0 + start
    prc ||= Proc.new {|x, y| x <=> y}

    array[start], array[pivot] = array[pivot], array[start]
    val = array[pivot]
    length += start
    start += 1
    current = start

    while current < length
      det = prc.call(array[current], val)

      if det == 1
        current += 1
      elsif det <= 0
        array[current], array[start] = array[start], array[current]
        start += 1
        current += 1
      end
    end

    start -= 1
    array[start], array[pivot] = array[pivot], array[start]
    return start
  end
end
