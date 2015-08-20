def bubble_sort arr
  n = arr.length - 1
  while n > 0 do 
    arr.each_with_index do |item, index|
      arr[index], arr[index+1] = arr[index+1], arr[index] if arr[index] >           arr[index+1]
      p arr
      break if index + 1 == n
    end
    n -=1
  end
  arr
end

p bubble_sort [4,3,78,2,0,2]
