##Bubble Sort using array
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

#Bubble Sort using array and block
def bubble_sort_by arr
    n = arr.length - 1
    while n > 0
        arr.each_with_index do |item, index|
            yield(arr[index] , arr[index+1]) > 0 ? true : (arr[index+1],                  arr[index] = arr[index], arr[index+1])
            # To avoid index + 1 being nil when on last iteration (index == n)
            if index + 1 == n
                break
            end
        end
        n -= 1
    end
    puts arr
end

bubble_sort_by(["hi","hello","hey", "bye","Mike", "to", "a"]) { |left,right| right.length - left.length }
