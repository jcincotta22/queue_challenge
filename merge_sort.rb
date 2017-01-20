def mergesort(array)
  return array if array.length == 1
  middle = array.length / 2
  merge mergesort(array[0...middle]), mergesort(array[middle..-1])
end


def merge(left, right)
  result = []
  until left.length == 0 || right.length == 0 do
    result << (left.first <= right.first ? left.shift : right.shift)
  end
  result + left + right
end

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
