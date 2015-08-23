module Enumerable
	def my_each
		index = 0
		while index < self.length
			yield self[index]
			index += 1
		end
		self
	end

	def my_each_with_index
		index = 0
		while index < self.length 
			yield self[index], index
			index += 1
		end
		self
	end

	def my_select
		result =[]
		self.my_each do |item|
			result << item if yield item
		end
		result
	end

	def my_all?
		unless block_given?
			self.my_each do |item| 
				if item == true 
					return true
				else
					return false
				end
			end
		else
			if self == self.my_select { |item| yield item }
				true
			else
				false
			end
		end
	end


end