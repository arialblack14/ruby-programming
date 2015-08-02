def caesar_cipher str, shifter
	down_alphabet = ("a".."z").to_a
	up_alphabet = ("A".."Z").to_a

	new_str = ""
	str.each_char do |element|
		
		#choose alphabet array if element is a capital or not
		if element == element.downcase
			alpharray = down_alphabet
		else
			alpharray = up_alphabet
		end			
		
		alpharray.each do |letter|
			if element == letter
				#set i to index and shift j by shifter
				i = alpharray.index(letter)
				j = i + shifter
				#wrap from "z" to "a" 
				j > 26 ? j = j - 26 : j

				element = alpharray[j].to_s
				new_str << element
				break
			end
			#in case of spaces, commas etc
			unless alpharray.include? element
				new_str << element
				break
			end
		end
	end

	puts new_str
end

caesar_cipher("What a string!", 5)