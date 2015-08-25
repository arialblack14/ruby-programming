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

	def my_any?
		item_state = []
		self.my_each do |item|
			item_state << (yield item)
			#check if there is at least one true item
			item_state.include? true ? true : false
		end
		item_state.include? true
	end

	def my_none?
		item_state = []
		unless block_given?
			#checks if there are false items
			self.my_each { |element| item_state << element unless element == false }
		else
			#also adds to item_state if there is a true item
			self.my_each { |item| item_state << item if yield(item) }
		end
		item_state.include? true
	end

	def my_count(*args)
		item_count = 0
		unless block_given?			
			if args.empty?
				self.my_each { |item| item_count += 1 }
			else			
				self.my_each { |item| item_count += 1 if item == args[0] }
			end
		else
			self.my_each { |item| item_count += 1 if yield item }
		end
		item_count
	end

	def my_map
		new_array = []
		return self unless block_given?
		self.my_each do |item| 
			new_array << yield(item)
		end
		new_array
	end

	def my_inject(arg = nil)
		result = arg || 0
		unless block_given?
			result = self.(arg)
		else
			self.my_each { |item|	result = yield(result, item) }
		end
		result
	end

	# ----------------------------
	#Test for 'my_inject' method	
	#multiply_els([2,4,5]) should return 40

	def myltiply_els arr
		arr.my_inject(:*)
	end	

end



