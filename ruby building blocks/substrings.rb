def substrings str, arr
	answer = {}

	arr.each do |element|
		occur = str.downcase.scan(element).length
		answer[element] = occur unless occur < 1
	end

	p answer
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
#Tests
substrings "below", dictionary
substrings "Howdy partner, sit down! How's it going", dictionary