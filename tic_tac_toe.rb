class Player
	attr_reader = :player_number

	def initialize player_number
		@player_number = player_number		
	end
end

class Choice
	def initialize chozen
		@chozen = chozen		
	end
end