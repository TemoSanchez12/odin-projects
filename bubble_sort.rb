def bubble_sort(array)
  for i in (0 .. array.length)
    i.upto(array.length - 1) do |j|
      aux = array[j]

      if (array[i] > array[j])
        array[j] = array[i]
        array[i] = aux
      end
    end
  end

  return array
end

print bubble_sort([4,3,78,2,0,2])
