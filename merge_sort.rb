
def missing_number(array)
  array = mergesort(array)
  array.each_with_index do |num, i|
    if array[0] != 1
      return 1
    elsif num + 1 != array[i+1]
      return num + 1
    end
  end
end

def merge_sort(array)
  if array.length <= 1
    return array
  end
  middle = array.length / 2
  left = array[0...middle]
  right = array[middle..-1]
  return merge(merge_sort(left), merge_sort(right), array)
end

def merge(left, right, array)
  i = 0
  j = 0
  k = 0
  while i < left.length && j < right.length
    if left[i] <= right[j]
      array[k] = left[i]
      i+=1
      k+=1
    else
      array[k] = right[j]
      j+=1
      k+=1
    end
  end
  while i < left.length
    array[k] = left[i]
    i+=1
    k+=1
  end
  while j < right.length
    array[k] = right[j]
    j+=1
    k+=1
  end
  return array
end

def quicksort(array, start, end_index)
  if start <= end_index
    p_index = partitian(array, start, end_index)
    quicksort(array, p_index+1, end_index)
    quicksort(array, start, p_index-1)
  else
    return array
  end
end

def partitian(array, start, end_index)
  pivot = array[end_index]
  p_index = start
  i = start
  while i < end_index
    if array[i] <= pivot
      array[i], array[p_index] = array[p_index], array[i]
      p_index += 1
    end
    i+=1
  end
  array[p_index], array[end_index] = array[end_index], array[p_index]
  return p_index
end

a = [2, 4, 6, 3, 12, 10, 19, 25, 14, 8]

print merge_sort(a)
puts
puts '================'
print quicksort(a, 0, a.length-1)
