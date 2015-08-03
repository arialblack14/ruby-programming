puts "What is the string you would like to count?"

words = gets.chomp
arr = words.split
str = {}
arr.each { |word| str[word] = arr.count(word) }
puts str