def stock_picker arr
	i = -1
	j = -i - 1
	diff = {}

	#set the difference between last element of array and previous 1
	#to a hash whose element is an array of the 2
	#The difference starts from the end in order to avoid the edge cases
	#e.g. highest stock on opening day
	arr.each do |value|
		arr.each do |elem|
			#Next day can not have lower stockprice or it is dropped
			diff[[arr[i], arr[i-j]]] = arr[i] - arr[i-j] unless arr.index(arr[i]) < arr.index(arr[i-j])
			j += 1
		end
		i -= 1
		j = i + 1
	end
	#Finds max value/key pair
	answer = diff.max_by { |k,v| v }[0]

	puts "Maximum profit is " + answer.inspect
	puts "On days : " + [arr.index(answer[0]), arr.index(answer[1])].to_s
end
stock_picker ([17,3,6,9,15,8,6,1,10])